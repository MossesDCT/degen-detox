import '../../../../l10n/generated/app_localizations.dart';
import '../entities/breathing_technique.dart';

abstract class BreathingRepository {
  Future<List<BreathingTechnique>> getTechniques([AppLocalizations? l10n]);
  Future<BreathingTechnique?> getTechniqueById(String id);
}
