import '../../domain/entities/soundscape.dart';
import '../../domain/repositories/soundscape_repository.dart';
import '../datasources/soundscape_local_datasource.dart';

class SoundscapeRepositoryImpl implements SoundscapeRepository {
  const SoundscapeRepositoryImpl({required this.datasource});

  final SoundscapeLocalDatasource datasource;

  @override
  Future<List<Soundscape>> getSoundscapes() async =>
      datasource.getSoundscapes();
}
