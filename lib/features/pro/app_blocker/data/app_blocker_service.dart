import 'dart:convert';
import 'dart:typed_data';

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
      'hasUsageStatsPermission': result['hasUsageStatsPermission'] as bool,
      'hasOverlayPermission': result['hasOverlayPermission'] as bool,
      'hasAccessibilityPermission':
          result['hasAccessibilityPermission'] as bool,
    };
  }

  /// Opens system settings for Usage Stats permission.
  Future<void> requestUsageStatsPermission() async {
    await _channel.invokeMethod('requestUsageStatsPermission');
  }

  /// Opens system settings for Overlay permission.
  Future<void> requestOverlayPermission() async {
    await _channel.invokeMethod('requestOverlayPermission');
  }

  /// Opens Accessibility Settings so the user can enable the blocker service.
  Future<void> requestAccessibilityPermission() async {
    await _channel.invokeMethod('requestAccessibilityPermission');
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

  /// Schedules daily blocking at wake time. NEVER blocks immediately.
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
