import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/education_snippet.dart';
import '../../domain/repositories/education_repository.dart';
import '../datasources/education_local_datasource.dart';

/// Implementation of [EducationRepository] using local data source.
class EducationRepositoryImpl implements EducationRepository {
  const EducationRepositoryImpl({required this.datasource});

  final EducationLocalDatasource datasource;

  @override
  Future<List<EducationSnippet>> getSnippets([AppLocalizations? l10n]) async {
    return datasource.getSnippets(l10n);
  }

  @override
  Future<List<EducationSnippet>> getSnippetsByCategory(SnippetCategory category,
      [AppLocalizations? l10n]) async {
    return datasource.getSnippetsByCategory(category, l10n);
  }
}
