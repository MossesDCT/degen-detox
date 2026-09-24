import '../../../../l10n/generated/app_localizations.dart';
import '../entities/education_snippet.dart';
import '../repositories/education_repository.dart';

/// Use case: fetch all education snippets.
class GetEducationSnippets {
  const GetEducationSnippets({required this.repository});

  final EducationRepository repository;

  Future<List<EducationSnippet>> call([AppLocalizations? l10n]) {
    return repository.getSnippets(l10n);
  }

  Future<List<EducationSnippet>> byCategory(SnippetCategory category,
      [AppLocalizations? l10n]) {
    return repository.getSnippetsByCategory(category, l10n);
  }
}
