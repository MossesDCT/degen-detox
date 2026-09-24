import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import '../../../../core/localization/app_localizations_helper.dart';

/// Mood level mapping.
enum MoodLevel {
  terrible, // 1
  bad, // 2
  okay, // 3
  good, // 4
  great, // 5
}

extension MoodLevelExtension on MoodLevel {
  int get value {
    switch (this) {
      case MoodLevel.terrible:
        return 1;
      case MoodLevel.bad:
        return 2;
      case MoodLevel.okay:
        return 3;
      case MoodLevel.good:
        return 4;
      case MoodLevel.great:
        return 5;
    }
  }

  /// Localized mood name. Prefer [getLocalizedName] when a context is available.
  @Deprecated('Use getLocalizedName(context) for localized output.')
  String get label {
    switch (this) {
      case MoodLevel.terrible:
        return 'Terrible';
      case MoodLevel.bad:
        return 'Bad';
      case MoodLevel.okay:
        return 'Okay';
      case MoodLevel.good:
        return 'Good';
      case MoodLevel.great:
        return 'Great';
    }
  }

  /// Returns the localized mood label using the current locale.
  String getLocalizedName(BuildContext context) {
    switch (this) {
      case MoodLevel.terrible:
        return context.l10n.moodTerrible;
      case MoodLevel.bad:
        return context.l10n.moodBad;
      case MoodLevel.okay:
        return context.l10n.moodOkay;
      case MoodLevel.good:
        return context.l10n.moodGood;
      case MoodLevel.great:
        return context.l10n.moodGreat;
    }
  }

  String get emoji {
    switch (this) {
      case MoodLevel.terrible:
        return '😰';
      case MoodLevel.bad:
        return '😔';
      case MoodLevel.okay:
        return '😐';
      case MoodLevel.good:
        return '🙂';
      case MoodLevel.great:
        return '😊';
    }
  }

  static MoodLevel fromValue(int value) {
    switch (value) {
      case 1:
        return MoodLevel.terrible;
      case 2:
        return MoodLevel.bad;
      case 3:
        return MoodLevel.okay;
      case 4:
        return MoodLevel.good;
      case 5:
        return MoodLevel.great;
      default:
        return MoodLevel.okay;
    }
  }
}

/// Domain entity for a journal entry.
class JournalEntry extends Equatable {
  const JournalEntry({
    required this.id,
    required this.mood,
    required this.date,
    this.note,
    this.tags = const [],
  });

  final String id;
  final MoodLevel mood;
  final DateTime date;
  final String? note;
  final List<String> tags;

  @override
  List<Object?> get props => [id, mood, date, note, tags];

  JournalEntry copyWith({
    String? id,
    MoodLevel? mood,
    DateTime? date,
    String? note,
    List<String>? tags,
  }) {
    return JournalEntry(
      id: id ?? this.id,
      mood: mood ?? this.mood,
      date: date ?? this.date,
      note: note ?? this.note,
      tags: tags ?? this.tags,
    );
  }
}
