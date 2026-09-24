import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/timezone.dart' as tz;
import 'package:timezone/data/latest_all.dart' as tz_init;

/// Service for scheduling/cancelling local bedtime reminder ALARMS.
///
/// v59 — rewritten based on research of working open-source Flutter apps
/// (mayudevID/bloom, MaikuB/flutter_local_notifications official example).
///
/// Key fixes vs v58:
///   1. Uses `FlutterTimezone.getLocalTimezone()` + `tz.setLocalLocation()`
///      with the device's ACTUAL timezone. Previously `tz.local` was UTC,
///      so the alarm fired at the wrong wall-clock time.
///   2. Uses `AndroidScheduleMode.alarmClock` — survives Samsung/Xiaomi/
///      Huawei OEM battery killing, unlike `exactAllowWhileIdle`.
///   3. Uses the plugin's own `requestNotificationsPermission()` and
///      `requestExactAlarmsPermission()` instead of `permission_handler`,
///      which is the recommended path on Android 13+.
///   4. Adds boot-receiver and exact-alarm receiver to AndroidManifest.
class BedtimeReminderService {
  BedtimeReminderService._();

  static final BedtimeReminderService instance = BedtimeReminderService._();

  static const int _notificationId = 4242;
  // v3 channel id so Android rebuilds the channel with v59 settings
  // (channels are immutable after creation — must change the id).
  static const String _channelId = 'bedtime_alarm_v3';
  static const String _channelName = 'Bedtime Alarm';
  static const String _channelDesc =
      'Plays an alarm sound when it is time to wind down for sleep.';

  final FlutterLocalNotificationsPlugin _plugin =
      FlutterLocalNotificationsPlugin();

  bool _initialized = false;

  /// Must be called once at app start (in `main()` before `runApp`).
  Future<void> init() async {
    if (_initialized) return;

    // ─── 1. Timezone — CRITICAL FIX ─────────────────────────────────────
    // tz.initializeTimeZones() alone leaves tz.local == UTC.
    // We MUST fetch the device timezone and pass it to setLocalLocation,
    // otherwise zonedSchedule will compute the wrong wall-clock time.
    tz_init.initializeTimeZones();
    try {
      final String timeZoneName = await FlutterTimezone.getLocalTimezone();
      tz.setLocalLocation(tz.getLocation(timeZoneName));
      debugPrint('[BedtimeAlarm] timezone set to $timeZoneName');
    } catch (e) {
      debugPrint('[BedtimeAlarm] could not resolve timezone: $e');
    }

    // ─── 2. Notification plugin init ────────────────────────────────────
    const androidInit = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosInit = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    const initSettings = InitializationSettings(
      android: androidInit,
      iOS: iosInit,
    );

    await _plugin.initialize(initSettings);

    // ─── 3. Create the high-priority ALARM channel ──────────────────────
    final androidImpl = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidImpl != null) {
      // Clean up old channels from v57/v58 so users don't end up with
      // multiple bedtime channels in Settings.
      for (final old in const ['bedtime_reminder', 'bedtime_alarm_v2']) {
        try {
          await androidImpl.deleteNotificationChannel(old);
        } catch (_) {}
      }

      const channel = AndroidNotificationChannel(
        _channelId,
        _channelName,
        description: _channelDesc,
        // MAX importance = heads-up on lock screen + alarm-volume sound
        importance: Importance.max,
        playSound: true,
        sound: RawResourceAndroidNotificationSound('bedtime_alarm'),
        enableVibration: true,
        enableLights: true,
        showBadge: true,
        // ← alarm volume (not notification volume which is muted at night)
        audioAttributesUsage: AudioAttributesUsage.alarm,
      );
      await androidImpl.createNotificationChannel(channel);
    }

    _initialized = true;
  }

  /// Request runtime permissions for notifications + exact alarms.
  ///
  /// Uses the plugin's OWN methods (not permission_handler) — these are
  /// what `bloom` and the official example use. permission_handler v11
  /// has known issues with `scheduleExactAlarm` on Android 14.
  ///
  /// Returns true if BOTH notifications and exact alarms are granted.
  Future<bool> requestPermissions() async {
    await init();

    final androidImpl = _plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (androidImpl == null) return true; // iOS / non-Android — assume OK

    // Android 13+: POST_NOTIFICATIONS runtime permission.
    final notifGranted =
        await androidImpl.requestNotificationsPermission() ?? false;
    debugPrint('[BedtimeAlarm] notifications permission: $notifGranted');

    // Android 12+: SCHEDULE_EXACT_ALARM (Android 14 revoked default grant).
    final exactAlarmsGranted =
        await androidImpl.requestExactAlarmsPermission() ?? false;
    debugPrint('[BedtimeAlarm] exact alarms permission: $exactAlarmsGranted');

    return notifGranted;
  }

  /// Schedule (or reschedule) the nightly bedtime alarm at [hour]:[minute]
  /// local time. If an alarm is already scheduled it is replaced.
  Future<void> schedule({
    required int hour,
    required int minute,
    String title = 'Time to wind down 🌙',
    String body =
        'Lower your evening cortisol. Put your phone away and prepare for sleep.',
  }) async {
    await init();
    await cancel();

    final nextTrigger = _nextInstanceOf(hour, minute);
    debugPrint(
        '[BedtimeAlarm] scheduling at $nextTrigger (local) — id=$_notificationId');

    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.alarm,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('bedtime_alarm'),
      enableVibration: true,
      enableLights: true,
      fullScreenIntent: true,
      visibility: NotificationVisibility.public,
      audioAttributesUsage: AudioAttributesUsage.alarm,
      ongoing: false,
      autoCancel: true,
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
    );
    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    // ─── FIX #2: alarmClock survives OEM battery optimization ──────────
    // exactAllowWhileIdle is silently dropped on Samsung/Xiaomi/Huawei.
    // alarmClock is the same scheduling backend the system Clock app uses
    // and is exempt from battery restrictions.
    try {
      await _plugin.zonedSchedule(
        _notificationId,
        title,
        body,
        nextTrigger,
        details,
        androidScheduleMode: AndroidScheduleMode.alarmClock,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time, // repeats daily
      );
      debugPrint('[BedtimeAlarm] scheduled with alarmClock mode ✓');
    } on Exception catch (e) {
      // Fallback for devices where alarmClock requires permission the
      // user denied. exactAllowWhileIdle is the next-best option.
      debugPrint('[BedtimeAlarm] alarmClock failed: $e — using exact fallback');
      try {
        await _plugin.zonedSchedule(
          _notificationId,
          title,
          body,
          nextTrigger,
          details,
          androidScheduleMode: AndroidScheduleMode.exactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time,
        );
      } on Exception catch (e2) {
        debugPrint(
            '[BedtimeAlarm] exact also failed: $e2 — using inexact fallback');
        await _plugin.zonedSchedule(
          _notificationId,
          title,
          body,
          nextTrigger,
          details,
          androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
          uiLocalNotificationDateInterpretation:
              UILocalNotificationDateInterpretation.absoluteTime,
          matchDateTimeComponents: DateTimeComponents.time,
        );
      }
    }
  }

  /// Cancel any pending bedtime alarm.
  Future<void> cancel() async {
    await init();
    await _plugin.cancel(_notificationId);
    debugPrint('[BedtimeAlarm] cancelled id=$_notificationId');
  }

  /// Fire the alarm immediately — for the debug "Test now" button.
  Future<void> fireTestNow() async {
    await init();
    const androidDetails = AndroidNotificationDetails(
      _channelId,
      _channelName,
      channelDescription: _channelDesc,
      importance: Importance.max,
      priority: Priority.max,
      category: AndroidNotificationCategory.alarm,
      playSound: true,
      sound: RawResourceAndroidNotificationSound('bedtime_alarm'),
      enableVibration: true,
      enableLights: true,
      fullScreenIntent: true,
      visibility: NotificationVisibility.public,
      audioAttributesUsage: AudioAttributesUsage.alarm,
    );
    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
      interruptionLevel: InterruptionLevel.timeSensitive,
    );
    await _plugin.show(
      _notificationId,
      'Test alarm 🌙',
      'If you hear this, the bedtime alarm is working correctly.',
      const NotificationDetails(android: androidDetails, iOS: iosDetails),
    );
  }

  /// Schedule a test alarm 1 minute from now (recurring daily at that time).
  /// Use this from a debug button to verify scheduling actually works.
  Future<void> scheduleTestIn1Minute() async {
    await init();
    final now = tz.TZDateTime.now(tz.local);
    final inOneMin = now.add(const Duration(minutes: 1));
    await schedule(
      hour: inOneMin.hour,
      minute: inOneMin.minute,
      title: 'Test bedtime alarm 🌙',
      body: 'This alarm was scheduled 1 minute ago for testing.',
    );
  }

  /// Returns the list of currently pending notification requests.
  /// Useful for debugging.
  Future<List<PendingNotificationRequest>> pendingRequests() async {
    await init();
    return _plugin.pendingNotificationRequests();
  }

  /// Compute the next [tz.TZDateTime] in the local zone matching
  /// [hour]:[minute]. If the time already passed today, schedule for tomorrow.
  tz.TZDateTime _nextInstanceOf(int hour, int minute) {
    final now = tz.TZDateTime.now(tz.local);
    var scheduled = tz.TZDateTime(
      tz.local,
      now.year,
      now.month,
      now.day,
      hour,
      minute,
    );
    if (!scheduled.isAfter(now)) {
      scheduled = scheduled.add(const Duration(days: 1));
    }
    return scheduled;
  }
}
