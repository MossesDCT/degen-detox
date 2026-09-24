/// Asset path constants for Cortisol Zero.
/// Centralizes all asset references to prevent typos and ease refactoring.
class AppAssets {
  AppAssets._();

  // ── Base Paths ─────────────────────────────────────────────────────────────
  static const String _audioBase = 'assets/audio/';
  static const String _imagesBase = 'assets/images/';
  static const String _animationsBase = 'assets/animations/';

  // ── Audio ──────────────────────────────────────────────────────────────────
  // Soundscapes - these files should be placed in assets/audio/
  static const String audioOceanWaves = '${_audioBase}ocean_waves.mp3';
  static const String audioGentleRain = '${_audioBase}gentle_rain.mp3';
  static const String audioCampfire = '${_audioBase}campfire.mp3';
  static const String audioBirds = '${_audioBase}morning_birds.mp3';
  static const String audioForestWind = '${_audioBase}forest_wind.mp3';
  static const String audioSummerNight = '${_audioBase}summer_night.mp3';

  // Guided Meditations (PRO)
  static const String audioMeditationMorning =
      '${_audioBase}meditation_morning.mp3';
  static const String audioMeditationSleep =
      '${_audioBase}meditation_sleep.mp3';
  static const String audioMeditationAnxiety =
      '${_audioBase}meditation_anxiety.mp3';
  static const String audioMeditationFocus =
      '${_audioBase}meditation_focus.mp3';
  static const String audioMeditationBodyScan =
      '${_audioBase}meditation_body_scan.mp3';

  // ── Images ─────────────────────────────────────────────────────────────────
  static const String imageOnboarding1 = '${_imagesBase}onboarding_1.png';
  static const String imageOnboarding2 = '${_imagesBase}onboarding_2.png';
  static const String imageOnboarding3 = '${_imagesBase}onboarding_3.png';
  static const String imageAppLogo = '${_imagesBase}logo.png';
  static const String imageProBanner = '${_imagesBase}pro_banner.png';
  static const String imageBreathingBackground =
      '${_imagesBase}breathing_bg.png';

  // ── Animations (Lottie) ────────────────────────────────────────────────────
  static const String animationBreathing =
      '${_animationsBase}breathing_circle.json';
  static const String animationSuccess = '${_animationsBase}success.json';
  static const String animationMeditation = '${_animationsBase}meditation.json';
  static const String animationSleeping = '${_animationsBase}sleeping.json';
  static const String animationLoading = '${_animationsBase}loading.json';
  static const String animationWaves = '${_animationsBase}waves.json';
  static const String animationNature = '${_animationsBase}nature.json';
}
