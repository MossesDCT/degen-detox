import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/breathing_technique.dart';
import '../../domain/repositories/breathing_repository.dart';
import '../datasources/breathing_local_datasource.dart';

class BreathingRepositoryImpl implements BreathingRepository {
  const BreathingRepositoryImpl({required this.datasource});

  final BreathingLocalDatasource datasource;

  @override
  Future<List<BreathingTechnique>> getTechniques(
          [AppLocalizations? l10n]) async =>
      datasource.getTechniques(l10n);

  @override
  Future<BreathingTechnique?> getTechniqueById(String id) async {
    final techniques = datasource.getTechniques();
    try {
      return techniques.firstWhere((t) => t.id == id);
    } catch (_) {
      return null;
    }
  }
}
