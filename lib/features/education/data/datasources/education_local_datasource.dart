import 'dart:ui';

import '../../../../l10n/generated/app_localizations.dart';
import '../models/education_snippet_model.dart';
import '../../domain/entities/education_snippet.dart';

/// Local data source providing all educational content about cortisol and stress.
/// Content is localized based on the provided AppLocalizations instance.
class EducationLocalDatasource {
  /// Returns all education snippets using the provided localization.
  List<EducationSnippetModel> getSnippets([AppLocalizations? l10n]) {
    final l = l10n ?? _fallbackEn();
    return _buildSnippets(l);
  }

  /// Returns snippets filtered by category.
  List<EducationSnippetModel> getSnippetsByCategory(SnippetCategory category,
      [AppLocalizations? l10n]) {
    return getSnippets(l10n).where((s) => s.category == category).toList();
  }

  AppLocalizations _fallbackEn() {
    return lookupAppLocalizations(const Locale('en'));
  }

  List<EducationSnippetModel> _buildSnippets(AppLocalizations l) {
    return [
      EducationSnippetModel(
        id: 'edu_001',
        title: l.eduTitle000,
        content: l.eduContent000,
        category: SnippetCategory.basics,
        readingTimeMinutes: 2,
        emoji: '🧬',
        isHighlighted: true,
      ),
      EducationSnippetModel(
        id: 'edu_002',
        title: l.eduTitle001,
        content: l.eduContent001,
        category: SnippetCategory.basics,
        readingTimeMinutes: 2,
        emoji: '🌅',
      ),
      EducationSnippetModel(
        id: 'edu_003',
        title: l.eduTitle002,
        content: l.eduContent002,
        category: SnippetCategory.science,
        readingTimeMinutes: 3,
        emoji: '🔬',
      ),
      EducationSnippetModel(
        id: 'edu_004',
        title: l.eduTitle003,
        content: l.eduContent003,
        category: SnippetCategory.science,
        readingTimeMinutes: 2,
        emoji: '⚡',
      ),
      EducationSnippetModel(
        id: 'edu_005',
        title: l.eduTitle004,
        content: l.eduContent004,
        category: SnippetCategory.impact,
        readingTimeMinutes: 3,
        emoji: '💊',
        isHighlighted: true,
      ),
      EducationSnippetModel(
        id: 'edu_006',
        title: l.eduTitle005,
        content: l.eduContent005,
        category: SnippetCategory.impact,
        readingTimeMinutes: 2,
        emoji: '🧠',
      ),
      EducationSnippetModel(
        id: 'edu_007',
        title: l.eduTitle006,
        content: l.eduContent006,
        category: SnippetCategory.reduction,
        readingTimeMinutes: 2,
        emoji: '🌬️',
        isHighlighted: true,
      ),
      EducationSnippetModel(
        id: 'edu_008',
        title: l.eduTitle007,
        content: l.eduContent007,
        category: SnippetCategory.reduction,
        readingTimeMinutes: 2,
        emoji: '🌿',
      ),
      EducationSnippetModel(
        id: 'edu_009',
        title: l.eduTitle008,
        content: l.eduContent008,
        category: SnippetCategory.lifestyle,
        readingTimeMinutes: 3,
        emoji: '🏃',
      ),
      EducationSnippetModel(
        id: 'edu_010',
        title: l.eduTitle009,
        content: l.eduContent009,
        category: SnippetCategory.lifestyle,
        readingTimeMinutes: 2,
        emoji: '🤝',
      ),
      EducationSnippetModel(
        id: 'edu_011',
        title: l.eduTitle010,
        content: l.eduContent010,
        category: SnippetCategory.sleep,
        readingTimeMinutes: 3,
        emoji: '😴',
      ),
      EducationSnippetModel(
        id: 'edu_012',
        title: l.eduTitle011,
        content: l.eduContent011,
        category: SnippetCategory.exercise,
        readingTimeMinutes: 2,
        emoji: '🧘',
      ),
      EducationSnippetModel(
        id: 'edu_013',
        title: l.eduTitle012,
        content: l.eduContent012,
        category: SnippetCategory.mindfulness,
        readingTimeMinutes: 2,
        emoji: '🧘‍♀️',
        isHighlighted: true,
      ),
      EducationSnippetModel(
        id: 'edu_014',
        title: l.eduTitle013,
        content: l.eduContent013,
        category: SnippetCategory.nutrition,
        readingTimeMinutes: 2,
        emoji: '🍎',
      ),
      EducationSnippetModel(
        id: 'edu_015',
        title: l.eduTitle014,
        content: l.eduContent014,
        category: SnippetCategory.nutrition,
        readingTimeMinutes: 3,
        emoji: '🦠',
      ),
      EducationSnippetModel(
        id: 'edu_016',
        title: l.eduTitle015,
        content: l.eduContent015,
        category: SnippetCategory.nutrition,
        readingTimeMinutes: 2,
        emoji: '💎',
      ),
      EducationSnippetModel(
        id: 'edu_017',
        title: l.eduTitle016,
        content: l.eduContent016,
        category: SnippetCategory.mindfulness,
        readingTimeMinutes: 2,
        emoji: '📔',
      ),
    ];
  }
}
