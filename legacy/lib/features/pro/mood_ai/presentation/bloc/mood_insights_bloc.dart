import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../../journal/data/datasources/journal_local_datasource.dart';

// ── Events ────────────────────────────────────────────────────────────────────

abstract class MoodInsightsEvent extends Equatable {
  const MoodInsightsEvent();
  @override
  List<Object?> get props => [];
}

class LoadMoodInsights extends MoodInsightsEvent {
  const LoadMoodInsights();
}

/// Retry loading after an error.
class RetryMoodInsights extends MoodInsightsEvent {
  const RetryMoodInsights();
}

// ── States ────────────────────────────────────────────────────────────────────

abstract class MoodInsightsState extends Equatable {
  const MoodInsightsState();
  @override
  List<Object?> get props => [];
}

class MoodInsightsInitial extends MoodInsightsState {
  const MoodInsightsInitial();
}

class MoodInsightsLoading extends MoodInsightsState {
  const MoodInsightsLoading();
}

class MoodInsightsLoaded extends MoodInsightsState {
  const MoodInsightsLoaded({
    required this.weeklyMoods,
    required this.weeklyAverage,
    required this.previousWeekAverage,
    required this.hasData,
    required this.threeDayMoods,
    required this.threeDayAverage,
    required this.hasThreeDayData,
  });

  /// Mood values for last 7 days (Mon-Sun). 0 means no entry.
  final List<double> weeklyMoods;
  final double weeklyAverage;
  final double previousWeekAverage;
  final bool hasData;

  /// Mood values for last 3 days. 0 means no entry.
  final List<double> threeDayMoods;
  final double threeDayAverage;
  final bool hasThreeDayData;

  double get trend => weeklyAverage - previousWeekAverage;

  @override
  List<Object?> get props => [
        weeklyMoods,
        weeklyAverage,
        previousWeekAverage,
        hasData,
        threeDayMoods,
        threeDayAverage,
        hasThreeDayData,
      ];
}

class MoodInsightsError extends MoodInsightsState {
  const MoodInsightsError(this.message);
  final String message;
  @override
  List<Object?> get props => [message];
}

// ── BLoC ──────────────────────────────────────────────────────────────────────

class MoodInsightsBloc extends Bloc<MoodInsightsEvent, MoodInsightsState> {
  MoodInsightsBloc({required this.datasource})
      : super(const MoodInsightsInitial()) {
    on<LoadMoodInsights>(_onLoad);
    on<RetryMoodInsights>((event, emit) async {
      await _onLoad(const LoadMoodInsights(), emit);
    });
  }

  final JournalLocalDatasource datasource;

  Future<void> _onLoad(
      LoadMoodInsights event, Emitter<MoodInsightsState> emit) async {
    emit(const MoodInsightsLoading());
    try {
      // Get this week's mood summary
      final summary = await datasource.getMoodSummaryForWeek();

      final now = DateTime.now();
      final weekStart = now.subtract(Duration(days: now.weekday - 1)); // Monday

      // ── 7-day array (Mon = 0 ... Sun = 6) ──
      final moods = <double>[];
      for (int i = 0; i < 7; i++) {
        final day = weekStart.add(Duration(days: i));
        final key =
            '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
        moods.add(summary[key]?.toDouble() ?? 0.0);
      }

      final validMoods = moods.where((m) => m > 0).toList();
      final average = validMoods.isNotEmpty
          ? validMoods.reduce((a, b) => a + b) / validMoods.length
          : 0.0;

      // ── 3-day array (today, yesterday, 2 days ago) ──
      final threeDayMoods = <double>[];
      for (int i = 2; i >= 0; i--) {
        final day = now.subtract(Duration(days: i));
        final key =
            '${day.year}-${day.month.toString().padLeft(2, '0')}-${day.day.toString().padLeft(2, '0')}';
        threeDayMoods.add(summary[key]?.toDouble() ?? 0.0);
      }

      final validThreeDayMoods = threeDayMoods.where((m) => m > 0).toList();
      final threeDayAverage = validThreeDayMoods.isNotEmpty
          ? validThreeDayMoods.reduce((a, b) => a + b) /
              validThreeDayMoods.length
          : 0.0;

      // For previous week, use a simple estimate (or 3.0 default)
      const previousAverage = 3.0;

      emit(MoodInsightsLoaded(
        weeklyMoods: moods,
        weeklyAverage: average,
        previousWeekAverage: previousAverage,
        // Lower threshold: show real data if ≥2 entries
        hasData: validMoods.length >= 2,
        threeDayMoods: threeDayMoods,
        threeDayAverage: threeDayAverage,
        hasThreeDayData: validThreeDayMoods.length >= 2,
      ));
    } catch (e) {
      emit(MoodInsightsError(e.toString()));
    }
  }
}
