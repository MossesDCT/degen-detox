import 'package:equatable/equatable.dart';

/// Categories for educational content.
enum SnippetCategory {
  basics,
  science,
  impact,
  reduction,
  lifestyle,
  nutrition,
  sleep,
  exercise,
  mindfulness,
}

/// Domain entity for an educational snippet about cortisol and stress.
class EducationSnippet extends Equatable {
  const EducationSnippet({
    required this.id,
    required this.title,
    required this.content,
    required this.category,
    required this.readingTimeMinutes,
    this.emoji,
    this.isHighlighted = false,
  });

  final String id;
  final String title;
  final String content;
  final SnippetCategory category;
  final int readingTimeMinutes;
  final String? emoji;
  final bool isHighlighted;

  /// English fallback category name (used only when l10n is not available)
  String get categoryName {
    switch (category) {
      case SnippetCategory.basics:
        return 'The Basics';
      case SnippetCategory.science:
        return 'The Science';
      case SnippetCategory.impact:
        return 'Health Impact';
      case SnippetCategory.reduction:
        return 'Reduction Tips';
      case SnippetCategory.lifestyle:
        return 'Lifestyle';
      case SnippetCategory.nutrition:
        return 'Nutrition';
      case SnippetCategory.sleep:
        return 'Sleep';
      case SnippetCategory.exercise:
        return 'Exercise';
      case SnippetCategory.mindfulness:
        return 'Mindfulness';
    }
  }

  @override
  List<Object?> get props =>
      [id, title, content, category, readingTimeMinutes, emoji, isHighlighted];
}
