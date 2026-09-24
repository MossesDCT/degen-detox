import '../../domain/entities/soundscape.dart';

class SoundscapeModel extends Soundscape {
  const SoundscapeModel({
    required super.id,
    required super.name,
    required super.description,
    required super.audioPath,
    required super.emoji,
    required super.primaryColor,
    required super.secondaryColor,
    super.isProOnly,
  });
}
