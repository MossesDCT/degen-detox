import 'package:flutter/material.dart';
import '../models/soundscape_model.dart';
import '../../../../core/constants/app_assets.dart';

/// Local data source for soundscape definitions.
/// Audio files must be placed in assets/audio/ directory.
class SoundscapeLocalDatasource {
  List<SoundscapeModel> getSoundscapes() => _soundscapes;

  static final List<SoundscapeModel> _soundscapes = [
    // ── Free Soundscapes ──────────────────────────────────────────────────────
    const SoundscapeModel(
      id: 'sound_001',
      name: 'Ocean Waves',
      description:
          'Gentle rolling waves with a soft sea breeze. The rhythmic pattern of ocean waves naturally synchronizes with your breathing, lowering cortisol.',
      audioPath: AppAssets.audioOceanWaves,
      emoji: '🌊',
      primaryColor: Color(0xFF1565C0),
      secondaryColor: Color(0xFF42A5F5),
    ),

    const SoundscapeModel(
      id: 'sound_002',
      name: 'Gentle Rain',
      description:
          'Soft rain falling on leaves and grass. Pink noise frequencies in rainfall are proven to reduce cortisol and aid deep sleep.',
      audioPath: AppAssets.audioGentleRain,
      emoji: '🌧️',
      primaryColor: Color(0xFF37474F),
      secondaryColor: Color(0xFF78909C),
    ),

    const SoundscapeModel(
      id: 'sound_003',
      name: 'Campfire',
      description:
          'A crackling campfire on a quiet evening. The unpredictable crackle pattern creates white noise that masks stress-inducing sounds.',
      audioPath: AppAssets.audioCampfire,
      emoji: '🔥',
      primaryColor: Color(0xFFBF360C),
      secondaryColor: Color(0xFFFF8F00),
    ),

    const SoundscapeModel(
      id: 'sound_004',
      name: 'Morning Birds',
      description:
          'A gentle chorus of birdsong at dawn. Birdsong is evolutionarily associated with safety — your nervous system recognizes it as a signal that no predators are near.',
      audioPath: AppAssets.audioBirds,
      emoji: '🐦',
      primaryColor: Color(0xFF2E7D32),
      secondaryColor: Color(0xFFF9A825),
    ),

    const SoundscapeModel(
      id: 'sound_005',
      name: 'Forest Wind',
      description:
          'Wind moving gently through tall trees in a forest. The 1/f noise pattern in wind through leaves is deeply soothing to the nervous system.',
      audioPath: AppAssets.audioForestWind,
      emoji: '🌲',
      primaryColor: Color(0xFF1B5E20),
      secondaryColor: Color(0xFF66BB6A),
    ),

    const SoundscapeModel(
      id: 'sound_006',
      name: 'Summer Night',
      description:
          'Crickets chirping on a warm summer evening. The steady rhythmic chirping of crickets creates a natural white noise that calms the mind and promotes restful sleep.',
      audioPath: AppAssets.audioSummerNight,
      emoji: '🦗',
      primaryColor: Color(0xFF1A237E),
      secondaryColor: Color(0xFF7C4DFF),
    ),
  ];
}
