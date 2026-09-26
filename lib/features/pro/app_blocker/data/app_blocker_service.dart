import 'dart:convert';

import 'package:flutter/services.dart';

/// Represents an installed app on the device.
class InstalledApp {
  const InstalledApp({
    required this.packageName,
    required this.appName,
    this.iconBytes,
  });

  final String packageName;
  final String appName;
  final Uint8List? iconBytes;
}

/// Native bridge for the App Blocker feature.
/// Communicates with Android via MethodChannel.
class AppBlockerNativeService {
  static const _channel = MethodChannel('com.degendetox.app/app_blocker');

  Future<Map<String, dynamic>> getBlockState() async {
    final result =
        await _channel.invokeMapMethod<String, dynamic>('getBlockState');
    if (result == null) throw StateError('Native block state unavailable');
    return result;
  }

  /// Returns a list of user-installed apps (excluding system and own app).
  Future<List<InstalledApp>> getInstalledApps() async {
    final List<dynamic> result =
        await _channel.invokeMethod('getInstalledApps');
    return result.map((item) {
      final map = Map<String, dynamic>.from(item);
      Uint8List? iconBytes;
      final iconBase64 = map['icon'] as String? ?? '';
      if (iconBase64.isNotEmpty) {
        try {
          iconBytes = base64Decode(iconBase64);
        } catch (_) {}
      }
      return InstalledApp(
        packageName: map['packageName'] as String,
        appName: map['appName'] as String,
        iconBytes: iconBytes,
      );
    }).toList();
  }

  /// Checks if required permissions are granted.
  Future<Map<String, bool>> checkPermissions() async {
    final result = await _channel.invokeMethod('checkPermissions');
    return {
      'hasAccessibilityPermission':
          result['hasAccessibilityPermission'] as bool,
      'serviceConnected': result['serviceConnected'] == true,
    };
  }

  /// Opens Accessibility Settings so the user can enable the blocker service.
  Future<void> requestAccessibilityPermission() async {
    await _channel.invokeMethod('requestAccessibilityPermission');
  }

  Future<void> openAppDetails() async {
    await _channel.invokeMethod('openAppDetails');
  }

  /// Starts the blocking foreground service.
  Future<void> startBlocking({
    required List<String> blockedPackages,
    required int durationMinutes,
  }) async {
    await _channel.invokeMethod('startBlocking', {
      'blockedPackages': blockedPackages,
      'durationMinutes': durationMinutes,
    });
  }

  /// Stops the blocking service.
  Future<void> stopBlocking() async {
    await _channel.invokeMethod('stopBlocking');
  }

  /// Whether the blocking service is currently running.
  Future<bool> isBlockingActive() async {
    final result = await _channel.invokeMethod('isBlockingActive');
    return result as bool;
  }

  /// Schedules daily blocking; activates immediately inside the chosen window.
  Future<void> scheduleBlocking({
    required List<String> blockedPackages,
    required int wakeHour,
    required int wakeMinute,
    required int durationHours,
  }) async {
    await _channel.invokeMethod('scheduleBlocking', {
      'blockedPackages': blockedPackages,
      'wakeHour': wakeHour,
      'wakeMinute': wakeMinute,
      'durationHours': durationHours,
    });
  }

  /// Cancels the daily schedule.
  Future<void> cancelSchedule() async {
    await _channel.invokeMethod('cancelSchedule');
  }

  /// Whether a schedule is set.
  Future<bool> isScheduleActive() async {
    final result = await _channel.invokeMethod('isScheduleActive');
    return result as bool;
  }
}
