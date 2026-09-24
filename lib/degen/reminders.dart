import 'package:flutter/foundation.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:timezone/data/latest_all.dart' as data;
import 'package:timezone/timezone.dart' as tz;
import 'package:shared_preferences/shared_preferences.dart';
import 'domain.dart';

/// A 7-day schedule. Replenishment after verified entitlement restoration is
/// still to be integrated. It is deliberately not a
/// full-screen intent: wellbeing reminders must not take over another app.
class GrassReminders {
  final plugin = FlutterLocalNotificationsPlugin();
  bool ready = false;
  Future<void> init(VoidCallback openGrass) async {
    if (kIsWeb || ready) return;
    data.initializeTimeZones();
    tz.setLocalLocation(
        tz.getLocation(await FlutterTimezone.getLocalTimezone()));
    await plugin.initialize(
        const InitializationSettings(
          android: AndroidInitializationSettings('@mipmap/ic_launcher'),
        ), onDidReceiveNotificationResponse: (r) {
      if (r.payload == 'grass') openGrass();
    });
    final launch = await plugin.getNotificationAppLaunchDetails();
    if (launch?.didNotificationLaunchApp == true &&
        launch?.notificationResponse?.payload == 'grass') {
      openGrass();
    }
    ready = true;
  }

  Future<bool> schedule(
      int hours, String title, String body, AccessPolicy access) async {
    if (kIsWeb || !ready || !access.grass || hours < 1 || hours > 8) {
      return false;
    }
    final android = plugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>();
    if (await android?.requestNotificationsPermission() != true) return false;
    await cancel();
    final now = tz.TZDateTime.now(tz.local);
    // Inexact alarms respect battery and OS scheduling; no precision guarantee.
    for (var i = 1; i <= 168 ~/ hours; i++) {
      await plugin.zonedSchedule(
        9000 + i,
        title,
        body,
        now.add(Duration(hours: i * hours)),
        const NotificationDetails(
            android: AndroidNotificationDetails(
          'grass_break_v1',
          'Touch Grass',
          importance: Importance.high,
          priority: Priority.high,
          playSound: true,
          enableVibration: true,
        )),
        payload: 'grass',
        androidScheduleMode: AndroidScheduleMode.inexactAllowWhileIdle,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
      );
    }
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('degen_grass_hours', hours);
    return true;
  }

  Future<void> cancel() async {
    if (kIsWeb) return;
    for (var i = 1; i <= 168; i++) {
      await plugin.cancel(9000 + i);
    }
    await (await SharedPreferences.getInstance()).remove('degen_grass_hours');
  }
}
