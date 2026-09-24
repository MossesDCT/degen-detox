/// App-wide string constants for Cortisol Zero.
/// These are non-translatable identifiers and technical strings.
class AppStrings {
  AppStrings._();

  // ── App Info ──────────────────────────────────────────────────────────────
  static const String appName = 'Cortisol Zero';
  static const String appTagline = 'Your daily stress reduction companion';
  static const String appVersion = '1.0.0';

  // ── Product IDs ───────────────────────────────────────────────────────────
  static const String proProductId = 'cortisol_zero_pro';

  // ── SharedPreferences Keys ────────────────────────────────────────────────
  static const String keyOnboardingComplete = 'onboarding_complete';
  static const String keyIsPro = 'is_pro';
  static const String keyPurchaseToken = 'purchase_token';
  static const String keyDailyStreak = 'daily_streak';
  static const String keyLastOpenDate = 'last_open_date';
  static const String keyThemeMode = 'theme_mode';
  static const String keyLanguageCode = 'language_code';
  static const String keyBedtimeReminder = 'bedtime_reminder';
  static const String keyBedtimeHour = 'bedtime_hour';
  static const String keyBedtimeMinute = 'bedtime_minute';
  static const String keyWakeHour = 'wake_hour';
  static const String keyWakeMinute = 'wake_minute';
  static const String keyLastJournalDate = 'last_journal_date';
  static const String keySleepTimerMinutes = 'sleep_timer_minutes';

  // ── Navigation Routes ─────────────────────────────────────────────────────
  static const String routeOnboarding = '/onboarding';
  static const String routeHome = '/home';
  static const String routeLearn = '/learn';
  static const String routeNutrition = '/learn/nutrition';
  static const String routeBreathe = '/breathe';
  static const String routeBreathingSession = '/breathe/session';
  static const String routeMore = '/more';
  static const String routeJournal = '/more/journal';
  static const String routeSleepTracker = '/more/sleep';
  static const String routeSettings = '/more/settings';
  static const String routeProUpgrade = '/pro/upgrade';
  static const String routeRecipes = '/pro/recipes';
  static const String routeRecipeDetail = '/pro/recipes/:id';
  static const String routeMeditationLibrary = '/pro/meditation';
  static const String routeAppBlocker = '/pro/app-blocker';
  static const String routeMoodInsights = '/pro/mood-insights';
  static const String routePrivacyOverview = '/privacy-overview';
  static const String routePrivacyPolicy = '/legal/privacy-policy';
  static const String routeTerms = '/legal/terms';

  // ── SharedPreferences Keys (Privacy)
  static const String keyPrivacyAccepted = 'privacy_accepted_v1';

  // ── Database ──────────────────────────────────────────────────────────────
  static const String dbName = 'cortisol_zero.db';
  static const int dbVersion = 1;
  static const String tableJournalEntries = 'journal_entries';
  static const String tableSleepEntries = 'sleep_entries';

  // ── Legal URLs ────────────────────────────────────────────────────────────
  static const String privacyPolicyUrl =
      'https://cortisolzero.app/privacy-policy';
  static const String termsOfServiceUrl =
      'https://cortisolzero.app/terms-of-service';
  static const String supportEmail = 'cartizolzero@gmail.com';

  // ── Play Store ────────────────────────────────────────────────────────────
  static const String playStoreUrl =
      'https://play.google.com/store/apps/details?id=app.cortisolzero';
}
