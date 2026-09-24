import '../../domain/entities/breathing_technique.dart';

class BreathingTechniqueModel extends BreathingTechnique {
  const BreathingTechniqueModel({
    required super.id,
    required super.name,
    required super.description,
    required super.phases,
    required super.totalCycles,
    required super.emoji,
    required super.primaryColor,
    required super.secondaryColor,
    super.benefits,
    super.difficultyLevel,
  });
}
