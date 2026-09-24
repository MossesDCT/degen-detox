import '../../../../l10n/generated/app_localizations.dart';
import '../entities/breathing_technique.dart';
import '../repositories/breathing_repository.dart';

class GetBreathingTechniques {
  const GetBreathingTechniques({required this.repository});

  final BreathingRepository repository;

  Future<List<BreathingTechnique>> call([AppLocalizations? l10n]) =>
      repository.getTechniques(l10n);
}
