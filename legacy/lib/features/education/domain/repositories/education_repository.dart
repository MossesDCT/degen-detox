import '../../../../l10n/generated/app_localizations.dart';
import '../entities/education_snippet.dart';

/// Abstract repository interface for education content.
abstract class EducationRepository {
  /// Returns all education snippets.
  Future<List<EducationSnippet>> getSnippets([AppLocalizations? l10n]);

  /// Returns snippets filtered by category.
  Future<List<EducationSnippet>> getSnippetsByCategory(SnippetCategory category,
      [AppLocalizations? l10n]);
}
