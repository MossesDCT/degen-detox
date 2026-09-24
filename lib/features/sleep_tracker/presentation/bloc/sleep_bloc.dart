import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_strings.dart';
import '../../data/bedtime_reminder_service.dart';

// ── Sleep Entry ───────────────────────────────────────────────────────────────

class SleepEntry extends Equatable {
  const SleepEntry({
    required this.id,
    required this.date,
    required this.quality, // 1-5
    required this.durationHours,
    required this.bedtime,
    required this.wakeTime,
    this.notes,
  });

  final String id;
  final DateTime date;
  final int quality;
  final double durationHours;
  final String bedtime; // HH:mm
  final String wakeTime; // HH:mm
  final String? notes;

  factory SleepEntry.fromJson(Map<String, dynamic> json) => SleepEntry(
        id: json['id'] as String,
        date: DateTime.parse(json['date'] as String),
        quality: json['quality'] as int,
        durationHours: (json['durationHours'] as num).toDouble(),
        bedtime: json['bedtime'] as String,
        wakeTime: json['wakeTime'] as String,
        notes: json['notes'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'date': date.toIso8601String(),
        'quality': quality,
        'durationHours': durationHours,
        'bedtime': bedtime,
        'wakeTime': wakeTime,
        'notes': notes,
      };

  @override
  List<Object?> get props =>
      [id, date, quality, durationHours, bedtime, wakeTime, notes];
}

// ── Events ────────────────────────────────────────────────────────────────────

abstract class SleepEvent extends Equatable {
  const SleepEvent();
  @override
  List<Object?> get props => [];
}

class LoadSleepData extends SleepEvent {
  const LoadSleepData();
}

class AddSleepEntry extends SleepEvent {
  const AddSleepEntry({
    required this.quality,
    required this.durationHours,
    required this.bedtime,
    required this.wakeTime,
    this.notes,
  });

  final int quality;
  final double durationHours;
  final String bedtime;
  final String wakeTime;
  final String? notes;

  @override
  List<Object?> get props => [quality, durationHours, bedtime, wakeTime, notes];
}

class UpdateBedtimeReminder extends SleepEvent {
  const UpdateBedtimeReminder({
    required this.enabled,
    this.hour,
    this.minute,
  });

  final bool enabled;
  final int? hour;
  final int? minute;

  @override
  List<Object?> get props => [enabled, hour, minute];
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class SleepState extends Equatable {
  const SleepState();
  @override
  List<Object?> get props => [];
}

class SleepInitial extends SleepState {
  const SleepInitial();
}

class SleepLoading extends SleepState {
  const SleepLoading();
}

class SleepLoaded extends SleepState {
  const SleepLoaded({
    required this.entries,
    required this.bedtimeReminderEnabled,
    required this.bedtimeHour,
    required this.bedtimeMinute,
  });

  final List<SleepEntry> entries;
  final bool bedtimeReminderEnabled;
  final int bedtimeHour;
  final int bedtimeMinute;

  double? get averageQuality {
    if (entries.isEmpty) return null;
    return entries.fold<double>(0, (s, e) => s + e.quality) / entries.length;
  }

  double? get averageDuration {
    if (entries.isEmpty) return null;
    return entries.fold<double>(0, (s, e) => s + e.durationHours) /
        entries.length;
  }

  /// Last 7 days entries for the chart.
  List<SleepEntry> get lastWeek {
    final cutoff = DateTime.now().subtract(const Duration(days: 7));
    return entries.where((e) => e.date.isAfter(cutoff)).toList()
      ..sort((a, b) => a.date.compareTo(b.date));
  }

  @override
  List<Object?> get props => [
        entries,
        bedtimeReminderEnabled,
        bedtimeHour,
        bedtimeMinute,
      ];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class SleepBloc extends Bloc<SleepEvent, SleepState> {
  SleepBloc({required this.prefs}) : super(const SleepInitial()) {
    on<LoadSleepData>(_onLoad);
    on<AddSleepEntry>(_onAdd);
    on<UpdateBedtimeReminder>(_onUpdateReminder);
  }

  final SharedPreferences prefs;

  static const _kSleepEntries = 'sleep_entries';

  Future<void> _onLoad(LoadSleepData event, Emitter<SleepState> emit) async {
    emit(const SleepLoading());

    final entriesJson = prefs.getStringList(_kSleepEntries) ?? [];
    final entries = entriesJson
        .map((j) => SleepEntry.fromJson(jsonDecode(j) as Map<String, dynamic>))
        .toList()
      ..sort((a, b) => b.date.compareTo(a.date));

    emit(SleepLoaded(
      entries: entries,
      bedtimeReminderEnabled:
          prefs.getBool(AppStrings.keyBedtimeReminder) ?? false,
      bedtimeHour: prefs.getInt(AppStrings.keyBedtimeHour) ?? 22,
      bedtimeMinute: prefs.getInt(AppStrings.keyBedtimeMinute) ?? 30,
    ));
  }

  Future<void> _onAdd(AddSleepEntry event, Emitter<SleepState> emit) async {
    final current = state;
    if (current is! SleepLoaded) return;

    final entry = SleepEntry(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      date: DateTime.now(),
      quality: event.quality,
      durationHours: event.durationHours,
      bedtime: event.bedtime,
      wakeTime: event.wakeTime,
      notes: event.notes,
    );

    final updated = [entry, ...current.entries];
    final jsonList = updated.map((e) => jsonEncode(e.toJson())).toList();
    await prefs.setStringList(_kSleepEntries, jsonList);

    emit(SleepLoaded(
      entries: updated,
      bedtimeReminderEnabled: current.bedtimeReminderEnabled,
      bedtimeHour: current.bedtimeHour,
      bedtimeMinute: current.bedtimeMinute,
    ));
  }

  Future<void> _onUpdateReminder(
      UpdateBedtimeReminder event, Emitter<SleepState> emit) async {
    final current = state;
    if (current is! SleepLoaded) return;

    await prefs.setBool(AppStrings.keyBedtimeReminder, event.enabled);
    if (event.hour != null) {
      await prefs.setInt(AppStrings.keyBedtimeHour, event.hour!);
    }
    if (event.minute != null) {
      await prefs.setInt(AppStrings.keyBedtimeMinute, event.minute!);
    }

    final newHour = event.hour ?? current.bedtimeHour;
    final newMinute = event.minute ?? current.bedtimeMinute;

    // Schedule or cancel the actual local notification.
    final reminder = BedtimeReminderService.instance;
    try {
      if (event.enabled) {
        // Ask for runtime permissions on first enable (no-op if already given).
        await reminder.requestPermissions();
        await reminder.schedule(hour: newHour, minute: newMinute);
      } else {
        await reminder.cancel();
      }
    } catch (e) {
      // Notification scheduling is best-effort. Don't fail the bloc state.
      // ignore: avoid_print
      print('[SleepBloc] bedtime reminder error: $e');
    }

    emit(SleepLoaded(
      entries: current.entries,
      bedtimeReminderEnabled: event.enabled,
      bedtimeHour: newHour,
      bedtimeMinute: newMinute,
    ));
  }
}
