import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/breathing_technique.dart';
import '../models/breathing_technique_model.dart';
import '../../../../core/constants/app_colors.dart';

/// Local data source for breathing techniques.
/// Includes 3 scientifically-backed techniques with full phase configurations.
class BreathingLocalDatasource {
  List<BreathingTechniqueModel> getTechniques([AppLocalizations? l10n]) {
    if (l10n == null) return _techniquesEn;
    return _buildLocalizedTechniques(l10n);
  }

  List<BreathingTechniqueModel> _buildLocalizedTechniques(AppLocalizations l) {
    return [
      // ── 1. Belly Breathing (Beginner) ──────────────────────────────────────
      BreathingTechniqueModel(
        id: 'breath_001',
        name: l.breathTechBelly,
        description: l.breathDescBelly,
        phases: [
          BreathingPhaseConfig(
            name: l.phaseInhale,
            durationSeconds: 5,
            instruction: l.breathInstrBellyInhale,
            type: BreathingPhaseType.inhale,
          ),
          BreathingPhaseConfig(
            name: l.phaseExhale,
            durationSeconds: 5,
            instruction: l.breathInstrBellyExhale,
            type: BreathingPhaseType.exhale,
          ),
        ],
        totalCycles: 10,
        emoji: '🌬️',
        primaryColor: AppColors.sageGreen,
        secondaryColor: AppColors.mintGreen,
        difficultyLevel: 1,
        benefits: [
          l.breathBenefitBelly1,
          l.breathBenefitBelly2,
          l.breathBenefitBelly3,
          l.breathBenefitBelly4,
        ],
      ),

      // ── 2. Box Breathing (Intermediate) ────────────────────────────────────
      BreathingTechniqueModel(
        id: 'breath_002',
        name: l.breathTechBox,
        description: l.breathDescBox,
        phases: [
          BreathingPhaseConfig(
            name: l.phaseInhale,
            durationSeconds: 4,
            instruction: l.breathInstrBoxInhale,
            type: BreathingPhaseType.inhale,
          ),
          BreathingPhaseConfig(
            name: l.phaseHold,
            durationSeconds: 4,
            instruction: l.breathInstrBoxHoldFull,
            type: BreathingPhaseType.hold,
          ),
          BreathingPhaseConfig(
            name: l.phaseExhale,
            durationSeconds: 4,
            instruction: l.breathInstrBoxExhale,
            type: BreathingPhaseType.exhale,
          ),
          BreathingPhaseConfig(
            name: l.phaseHold,
            durationSeconds: 4,
            instruction: l.breathInstrBoxHoldEmpty,
            type: BreathingPhaseType.hold,
          ),
        ],
        totalCycles: 8,
        emoji: '⬛',
        primaryColor: AppColors.oceanBlue,
        secondaryColor: AppColors.skyBlue,
        difficultyLevel: 2,
        benefits: [
          l.breathBenefitBox1,
          l.breathBenefitBox2,
          l.breathBenefitBox3,
          l.breathBenefitBox4,
          l.breathBenefitBox5,
        ],
      ),

      // ── 3. 4-7-8 Breathing (Advanced) ──────────────────────────────────────
      BreathingTechniqueModel(
        id: 'breath_003',
        name: l.breathTech478,
        description: l.breathDesc478,
        phases: [
          BreathingPhaseConfig(
            name: l.phaseInhale,
            durationSeconds: 4,
            instruction: l.breathInstr478Inhale,
            type: BreathingPhaseType.inhale,
          ),
          BreathingPhaseConfig(
            name: l.phaseHold,
            durationSeconds: 7,
            instruction: l.breathInstr478Hold,
            type: BreathingPhaseType.hold,
          ),
          BreathingPhaseConfig(
            name: l.phaseExhale,
            durationSeconds: 8,
            instruction: l.breathInstr478Exhale,
            type: BreathingPhaseType.exhale,
          ),
        ],
        totalCycles: 4,
        emoji: '✨',
        primaryColor: AppColors.deepLavender,
        secondaryColor: AppColors.lavender,
        difficultyLevel: 3,
        benefits: [
          l.breathBenefit4781,
          l.breathBenefit4782,
          l.breathBenefit4783,
          l.breathBenefit4784,
          l.breathBenefit4785,
          l.breathBenefit4786,
        ],
      ),
    ];
  }

  static final List<BreathingTechniqueModel> _techniquesEn = [
    // ── 1. Belly Breathing (Beginner) ────────────────────────────────────────
    BreathingTechniqueModel(
      id: 'breath_001',
      name: 'Belly Breathing',
      description:
          'The foundation of all breathwork. Also called diaphragmatic breathing, this activates your parasympathetic nervous system immediately. Perfect for beginners or anyone needing a quick stress reset.',
      phases: const [
        BreathingPhaseConfig(
          name: 'Inhale',
          durationSeconds: 5,
          instruction:
              'Breathe in slowly through your nose, filling your belly',
          type: BreathingPhaseType.inhale,
        ),
        BreathingPhaseConfig(
          name: 'Exhale',
          durationSeconds: 5,
          instruction:
              'Breathe out slowly through your mouth, emptying your belly',
          type: BreathingPhaseType.exhale,
        ),
      ],
      totalCycles: 10,
      emoji: '🌬️',
      primaryColor: AppColors.sageGreen,
      secondaryColor: AppColors.mintGreen,
      difficultyLevel: 1,
      benefits: [
        'Activates parasympathetic nervous system',
        'Reduces cortisol within minutes',
        'Lowers heart rate and blood pressure',
        'Improves oxygen exchange',
      ],
    ),

    // ── 2. Box Breathing (Intermediate) ──────────────────────────────────────
    BreathingTechniqueModel(
      id: 'breath_002',
      name: 'Box Breathing',
      description:
          'Used by Navy SEALs and elite athletes to maintain calm under extreme pressure. Equal-duration phases create a "box" pattern that rapidly resets the nervous system. Excellent for focus and pre-performance anxiety.',
      phases: const [
        BreathingPhaseConfig(
          name: 'Inhale',
          durationSeconds: 4,
          instruction: 'Inhale slowly through your nose, counting to 4',
          type: BreathingPhaseType.inhale,
        ),
        BreathingPhaseConfig(
          name: 'Hold',
          durationSeconds: 4,
          instruction: 'Hold gently — lungs full, body relaxed',
          type: BreathingPhaseType.hold,
        ),
        BreathingPhaseConfig(
          name: 'Exhale',
          durationSeconds: 4,
          instruction: 'Exhale completely through your mouth, counting to 4',
          type: BreathingPhaseType.exhale,
        ),
        BreathingPhaseConfig(
          name: 'Hold',
          durationSeconds: 4,
          instruction: 'Hold gently — lungs empty, body relaxed',
          type: BreathingPhaseType.hold,
        ),
      ],
      totalCycles: 8,
      emoji: '⬛',
      primaryColor: AppColors.oceanBlue,
      secondaryColor: AppColors.skyBlue,
      difficultyLevel: 2,
      benefits: [
        'Rapid stress and anxiety reduction',
        'Improves focus and concentration',
        'Used by Navy SEALs and elite performers',
        'Balances CO2 and O2 levels',
        'Reduces cortisol response',
      ],
    ),

    // ── 3. 4-7-8 Breathing (Advanced) ────────────────────────────────────────
    BreathingTechniqueModel(
      id: 'breath_003',
      name: '4-7-8 Breathing',
      description:
          'Developed by Dr. Andrew Weil based on yogic pranayama traditions. The extended exhale (8 counts) activates the vagal brake on the stress response. Dr. Weil calls it "a natural tranquilizer for the nervous system."',
      phases: const [
        BreathingPhaseConfig(
          name: 'Inhale',
          durationSeconds: 4,
          instruction: 'Inhale quietly through your nose for 4 counts',
          type: BreathingPhaseType.inhale,
        ),
        BreathingPhaseConfig(
          name: 'Hold',
          durationSeconds: 7,
          instruction: 'Hold your breath completely for 7 counts',
          type: BreathingPhaseType.hold,
        ),
        BreathingPhaseConfig(
          name: 'Exhale',
          durationSeconds: 8,
          instruction:
              'Exhale completely through your mouth with a whoosh sound for 8 counts',
          type: BreathingPhaseType.exhale,
        ),
      ],
      totalCycles: 4,
      emoji: '✨',
      primaryColor: AppColors.deepLavender,
      secondaryColor: AppColors.lavender,
      difficultyLevel: 3,
      benefits: [
        'Natural tranquilizer effect',
        'Reduces acute anxiety in minutes',
        'Activates the vagus nerve',
        'Helps with insomnia — do before bed',
        'Manages food cravings from stress',
        'Based on ancient yogic pranayama',
      ],
    ),
  ];
}
