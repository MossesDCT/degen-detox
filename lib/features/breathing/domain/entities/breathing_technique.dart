import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Type of a breathing phase — used for animation/logic regardless of locale.
enum BreathingPhaseType { inhale, hold, exhale }

/// A single phase in a breathing cycle.
class BreathingPhaseConfig extends Equatable {
  const BreathingPhaseConfig({
    required this.name,
    required this.durationSeconds,
    required this.instruction,
    this.type = BreathingPhaseType.hold,
  });

  final String name; // Localized display name (e.g. "Įkvėpkite")
  final int durationSeconds;
  final String instruction;
  final BreathingPhaseType type; // For animation/logic

  @override
  List<Object?> get props => [name, durationSeconds, instruction, type];
}

/// Domain entity for a breathing technique.
class BreathingTechnique extends Equatable {
  const BreathingTechnique({
    required this.id,
    required this.name,
    required this.description,
    required this.phases,
    required this.totalCycles,
    required this.emoji,
    required this.primaryColor,
    required this.secondaryColor,
    this.benefits = const [],
    this.difficultyLevel = 1,
  });

  final String id;
  final String name;
  final String description;

  /// The sequence of phases in one complete cycle.
  final List<BreathingPhaseConfig> phases;

  /// Recommended number of cycles per session.
  final int totalCycles;

  final String emoji;
  final Color primaryColor;
  final Color secondaryColor;
  final List<String> benefits;

  /// 1 = Beginner, 2 = Intermediate, 3 = Advanced
  final int difficultyLevel;

  String get difficultyLabel {
    switch (difficultyLevel) {
      case 1:
        return 'Beginner';
      case 2:
        return 'Intermediate';
      case 3:
        return 'Advanced';
      default:
        return 'Beginner';
    }
  }

  /// Total duration of one cycle in seconds.
  int get cycleDurationSeconds =>
      phases.fold(0, (sum, p) => sum + p.durationSeconds);

  /// Total session duration in seconds.
  int get sessionDurationSeconds => cycleDurationSeconds * totalCycles;

  /// Formatted session duration string.
  String get sessionDurationFormatted {
    final total = sessionDurationSeconds;
    if (total < 60) return '$total sec';
    final min = total ~/ 60;
    final sec = total % 60;
    return sec == 0 ? '$min min' : '$min min $sec sec';
  }

  @override
  List<Object?> get props =>
      [id, name, description, phases, totalCycles, emoji, difficultyLevel];
}
