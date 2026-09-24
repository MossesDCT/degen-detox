import '../entities/soundscape.dart';

abstract class SoundscapeRepository {
  Future<List<Soundscape>> getSoundscapes();
}
