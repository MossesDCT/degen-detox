import '../entities/soundscape.dart';
import '../repositories/soundscape_repository.dart';

class GetSoundscapes {
  const GetSoundscapes({required this.repository});

  final SoundscapeRepository repository;

  Future<List<Soundscape>> call() => repository.getSoundscapes();
}
