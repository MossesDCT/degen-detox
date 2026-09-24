import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../data/app_blocker_service.dart';

// ── Events ────────────────────────────────────────────────────────────────────
abstract class AppBlockerEvent extends Equatable {
  const AppBlockerEvent();
  @override
  List<Object?> get props => [];
}

class LoadAppBlockerSettings extends AppBlockerEvent {
  const LoadAppBlockerSettings();
}

class ToggleAppBlocker extends AppBlockerEvent {
  const ToggleAppBlocker(this.enabled);
  final bool enabled;
  @override
  List<Object?> get props => [enabled];
}

class UpdateBlockDuration extends AppBlockerEvent {
  const UpdateBlockDuration(this.hours);
  final int hours;
  @override
  List<Object?> get props => [hours];
}

class UpdateWakeTime extends AppBlockerEvent {
  const UpdateWakeTime(this.hour, this.minute);
  final int hour;
  final int minute;
  @override
  List<Object?> get props => [hour, minute];
}

class LoadInstalledApps extends AppBlockerEvent {
  const LoadInstalledApps();
}

class ToggleBlockedApp extends AppBlockerEvent {
  const ToggleBlockedApp(this.packageName);
  final String packageName;
  @override
  List<Object?> get props => [packageName];
}

class StartBlockingNow extends AppBlockerEvent {
  const StartBlockingNow();
}

class StopBlockingNow extends AppBlockerEvent {
  const StopBlockingNow();
}

class CheckPermissions extends AppBlockerEvent {
  const CheckPermissions();
}

class RequestUsageStatsPermission extends AppBlockerEvent {
  const RequestUsageStatsPermission();
}

class RequestOverlayPermission extends AppBlockerEvent {
  const RequestOverlayPermission();
}

class RequestAccessibilityPermission extends AppBlockerEvent {
  const RequestAccessibilityPermission();
}

// ── States ────────────────────────────────────────────────────────────────────
abstract class AppBlockerState extends Equatable {
  const AppBlockerState();
  @override
  List<Object?> get props => [];
}

class AppBlockerInitial extends AppBlockerState {
  const AppBlockerInitial();
}

class AppBlockerLoading extends AppBlockerState {
  const AppBlockerLoading();
}

class AppBlockerLoaded extends AppBlockerState {
  const AppBlockerLoaded({
    required this.isEnabled,
    required this.blockDurationHours,
    required this.wakeHour,
    required this.wakeMinute,
    this.blockedPackages = const [],
    this.installedApps = const [],
    this.hasUsageStatsPermission = false,
    this.hasOverlayPermission = false,
    this.hasAccessibilityPermission = false,
    this.isBlocking = false,
  });

  final bool isEnabled;
  final int blockDurationHours;
  final int wakeHour;
  final int wakeMinute;
  final List<String> blockedPackages;
  final List<InstalledApp> installedApps;
  final bool hasUsageStatsPermission;
  final bool hasOverlayPermission;
  final bool hasAccessibilityPermission;
  final bool isBlocking;

  bool get hasAllPermissions =>
      hasUsageStatsPermission &&
      hasOverlayPermission &&
      hasAccessibilityPermission;

  AppBlockerLoaded copyWith({
    bool? isEnabled,
    int? blockDurationHours,
    int? wakeHour,
    int? wakeMinute,
    List<String>? blockedPackages,
    List<InstalledApp>? installedApps,
    bool? hasUsageStatsPermission,
    bool? hasOverlayPermission,
    bool? hasAccessibilityPermission,
    bool? isBlocking,
  }) {
    return AppBlockerLoaded(
      isEnabled: isEnabled ?? this.isEnabled,
      blockDurationHours: blockDurationHours ?? this.blockDurationHours,
      wakeHour: wakeHour ?? this.wakeHour,
      wakeMinute: wakeMinute ?? this.wakeMinute,
      blockedPackages: blockedPackages ?? this.blockedPackages,
      installedApps: installedApps ?? this.installedApps,
      hasUsageStatsPermission:
          hasUsageStatsPermission ?? this.hasUsageStatsPermission,
      hasOverlayPermission: hasOverlayPermission ?? this.hasOverlayPermission,
      hasAccessibilityPermission:
          hasAccessibilityPermission ?? this.hasAccessibilityPermission,
      isBlocking: isBlocking ?? this.isBlocking,
    );
  }

  @override
  List<Object?> get props => [
        isEnabled,
        blockDurationHours,
        wakeHour,
        wakeMinute,
        blockedPackages,
        installedApps.length,
        hasUsageStatsPermission,
        hasOverlayPermission,
        hasAccessibilityPermission,
        isBlocking,
      ];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────
class AppBlockerBloc extends Bloc<AppBlockerEvent, AppBlockerState> {
  AppBlockerBloc({required this.prefs})
      : _nativeService = AppBlockerNativeService(),
        super(const AppBlockerInitial()) {
    on<LoadAppBlockerSettings>(_onLoad);
    on<ToggleAppBlocker>(_onToggle);
    on<UpdateBlockDuration>(_onUpdateDuration);
    on<UpdateWakeTime>(_onUpdateWakeTime);
    on<LoadInstalledApps>(_onLoadInstalledApps);
    on<ToggleBlockedApp>(_onToggleBlockedApp);
    on<StartBlockingNow>(_onStartBlocking);
    on<StopBlockingNow>(_onStopBlocking);
    on<CheckPermissions>(_onCheckPermissions);
    on<RequestUsageStatsPermission>(_onRequestUsageStats);
    on<RequestOverlayPermission>(_onRequestOverlay);
    on<RequestAccessibilityPermission>(_onRequestAccessibility);
  }

  final SharedPreferences prefs;
  final AppBlockerNativeService _nativeService;

  static const _kEnabled = 'app_blocker_enabled';
  static const _kDuration = 'app_blocker_duration';
  static const _kWakeHour = 'app_blocker_wake_hour';
  static const _kWakeMinute = 'app_blocker_wake_minute';
  static const _kBlockedPackages = 'app_blocker_blocked_packages';

  Future<void> _onLoad(
      LoadAppBlockerSettings event, Emitter<AppBlockerState> emit) async {
    emit(const AppBlockerLoading());

    final blockedJson = prefs.getString(_kBlockedPackages);
    List<String> blockedPackages = [];
    if (blockedJson != null) {
      blockedPackages = List<String>.from(json.decode(blockedJson));
    }

    // Check permissions + blocking status
    bool hasUsage = false;
    bool hasOverlay = false;
    bool hasAccessibility = false;
    bool isBlocking = false;
    try {
      final perms = await _nativeService.checkPermissions();
      hasUsage = perms['hasUsageStatsPermission'] ?? false;
      hasOverlay = perms['hasOverlayPermission'] ?? false;
      hasAccessibility = perms['hasAccessibilityPermission'] ?? false;
      isBlocking = await _nativeService.isBlockingActive();
    } catch (e) {
      debugPrint('[AppBlockerBloc] Permission check failed: $e');
    }

    emit(AppBlockerLoaded(
      isEnabled: prefs.getBool(_kEnabled) ?? false,
      blockDurationHours: prefs.getInt(_kDuration) ?? 2,
      wakeHour: prefs.getInt(_kWakeHour) ?? 7,
      wakeMinute: prefs.getInt(_kWakeMinute) ?? 0,
      blockedPackages: blockedPackages,
      hasUsageStatsPermission: hasUsage,
      hasOverlayPermission: hasOverlay,
      hasAccessibilityPermission: hasAccessibility,
      isBlocking: isBlocking,
    ));
  }

  Future<void> _onToggle(
      ToggleAppBlocker event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;
    // Prevent disabling while blocking is active
    if (!event.enabled && current.isBlocking) return;
    await prefs.setBool(_kEnabled, event.enabled);

    if (!event.enabled) {
      // v60 fix: when disabling, cancel BOTH the active block AND the
      // scheduled daily alarm. Previously only stopBlocking() was called,
      // so the next morning's alarm still triggered with the saved packages.
      try {
        await _nativeService.cancelSchedule();
      } catch (_) {}
      try {
        await _nativeService.stopBlocking();
      } catch (_) {}
    } else {
      // v60 fix: when re-enabling, immediately schedule with current
      // settings so the native side has the latest packages + wake time.
      if (current.blockedPackages.isNotEmpty) {
        try {
          await _nativeService.scheduleBlocking(
            blockedPackages: current.blockedPackages,
            wakeHour: current.wakeHour,
            wakeMinute: current.wakeMinute,
            durationHours: current.blockDurationHours,
          );
        } catch (e) {
          debugPrint('[AppBlockerBloc] reschedule on enable failed: $e');
        }
      }
    }

    emit(current.copyWith(
      isEnabled: event.enabled,
      isBlocking: event.enabled ? current.isBlocking : false,
    ));
  }

  Future<void> _onUpdateDuration(
      UpdateBlockDuration event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;
    await prefs.setInt(_kDuration, event.hours);
    emit(current.copyWith(blockDurationHours: event.hours));

    // v60 fix: if blocker is currently enabled with apps, push the new
    // duration to the native scheduler immediately so tomorrow's alarm
    // uses the new value (not the old SharedPreferences value).
    await _resyncSchedule(
      current.copyWith(blockDurationHours: event.hours),
    );
  }

  Future<void> _onUpdateWakeTime(
      UpdateWakeTime event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;
    await prefs.setInt(_kWakeHour, event.hour);
    await prefs.setInt(_kWakeMinute, event.minute);
    emit(current.copyWith(wakeHour: event.hour, wakeMinute: event.minute));

    // v60 fix: re-schedule with the new wake time so the alarm fires at
    // the correct hour starting tomorrow.
    await _resyncSchedule(
      current.copyWith(wakeHour: event.hour, wakeMinute: event.minute),
    );
  }

  Future<void> _onLoadInstalledApps(
      LoadInstalledApps event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;
    try {
      final apps = await _nativeService.getInstalledApps();
      emit(current.copyWith(installedApps: apps));
    } catch (e) {
      debugPrint('[AppBlockerBloc] getInstalledApps failed: $e');
    }
  }

  Future<void> _onToggleBlockedApp(
      ToggleBlockedApp event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;

    final updated = List<String>.from(current.blockedPackages);
    if (updated.contains(event.packageName)) {
      updated.remove(event.packageName);
    } else {
      updated.add(event.packageName);
    }

    await prefs.setString(_kBlockedPackages, json.encode(updated));
    emit(current.copyWith(blockedPackages: updated));

    // v60 fix: keep the native schedule in sync with the list.
    //   • If list becomes empty → fully cancel schedule + stop any active
    //     blocking, so tomorrow's alarm doesn't fire with stale packages.
    //   • If list still has apps and blocker is enabled → re-schedule with
    //     the updated package list.
    if (updated.isEmpty) {
      try {
        await _nativeService.cancelSchedule();
      } catch (_) {}
      try {
        await _nativeService.stopBlocking();
      } catch (_) {}
      emit(current.copyWith(
        blockedPackages: updated,
        isBlocking: false,
      ));
    } else {
      await _resyncSchedule(current.copyWith(blockedPackages: updated));
    }
  }

  /// v60 helper: push the current (enabled + packages + time + duration)
  /// settings to the native scheduler. No-op if blocker is disabled or the
  /// blocked apps list is empty — those cases are handled by the callers.
  Future<void> _resyncSchedule(AppBlockerLoaded s) async {
    if (!s.isEnabled) return;
    if (s.blockedPackages.isEmpty) return;
    try {
      await _nativeService.scheduleBlocking(
        blockedPackages: s.blockedPackages,
        wakeHour: s.wakeHour,
        wakeMinute: s.wakeMinute,
        durationHours: s.blockDurationHours,
      );
    } catch (e) {
      debugPrint('[AppBlockerBloc] resync schedule failed: $e');
    }
  }

  Future<void> _onStartBlocking(
      StartBlockingNow event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;
    if (current.blockedPackages.isEmpty) return;

    try {
      // Schedule blocking for wake time — NEVER blocks immediately
      await _nativeService.scheduleBlocking(
        blockedPackages: current.blockedPackages,
        wakeHour: current.wakeHour,
        wakeMinute: current.wakeMinute,
        durationHours: current.blockDurationHours,
      );
      emit(current.copyWith(isBlocking: true));
    } catch (e) {
      debugPrint('[AppBlockerBloc] scheduleBlocking failed: $e');
    }
  }

  Future<void> _onStopBlocking(
      StopBlockingNow event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;

    try {
      await _nativeService.cancelSchedule();
      await _nativeService.stopBlocking();
      emit(current.copyWith(isBlocking: false));
    } catch (_) {}
  }

  Future<void> _onCheckPermissions(
      CheckPermissions event, Emitter<AppBlockerState> emit) async {
    final current = state;
    if (current is! AppBlockerLoaded) return;

    try {
      final perms = await _nativeService.checkPermissions();
      emit(current.copyWith(
        hasUsageStatsPermission: perms['hasUsageStatsPermission'] ?? false,
        hasOverlayPermission: perms['hasOverlayPermission'] ?? false,
        hasAccessibilityPermission:
            perms['hasAccessibilityPermission'] ?? false,
      ));
    } catch (_) {}
  }

  Future<void> _onRequestUsageStats(
      RequestUsageStatsPermission event, Emitter<AppBlockerState> emit) async {
    try {
      await _nativeService.requestUsageStatsPermission();
    } catch (_) {}
  }

  Future<void> _onRequestOverlay(
      RequestOverlayPermission event, Emitter<AppBlockerState> emit) async {
    try {
      await _nativeService.requestOverlayPermission();
    } catch (_) {}
  }

  Future<void> _onRequestAccessibility(RequestAccessibilityPermission event,
      Emitter<AppBlockerState> emit) async {
    try {
      await _nativeService.requestAccessibilityPermission();
    } catch (_) {}
  }
}
