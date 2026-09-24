/// Build configuration constants for Cortisol Zero.
/// Centralizes environment-specific values.
class BuildConfig {
  BuildConfig._();

  // ── App Identification ─────────────────────────────────────────────────────
  static const String applicationId = 'app.cortisolzero';
  static const int versionCode = 1;
  static const String versionName = '1.0.0';

  // ── Android SDK Targets ───────────────────────────────────────────────────
  static const int minSdkVersion = 21; // Android 5.0 Lollipop
  static const int targetSdkVersion = 34; // Android 14
  static const int compileSdkVersion = 34;

  // ── Build Types ───────────────────────────────────────────────────────────
  static const bool isDebug = bool.fromEnvironment('dart.vm.product') == false;
  static const bool isRelease = bool.fromEnvironment('dart.vm.product');

  // ── Feature Flags ─────────────────────────────────────────────────────────
  /// Enable AI mood analysis features (PRO)
  static const bool enableMoodAi = true;

  /// Enable app blocking feature (requires AccessibilityService on Android)
  static const bool enableAppBlocker = true;

  /// Enable guided meditation library (PRO)
  static const bool enableMeditations = true;

  // ── Analytics / Logging ───────────────────────────────────────────────────
  /// Log debug messages to console
  static const bool enableLogging = isDebug;

  // ── In-App Purchase ───────────────────────────────────────────────────────
  static const String proProductId = 'cortisol_zero_pro';
  static const double proPriceUsd = 6.50;

  // ── Notification Channel IDs (Android) ───────────────────────────────────
  static const String notificationChannelBedtime = 'bedtime_reminder';
  static const String notificationChannelMorning = 'morning_checkin';
  static const String notificationChannelStreak = 'streak_reminder';

  // ── Permissions (Android manifest names) ─────────────────────────────────
  // TODO(android): Add to AndroidManifest.xml for app blocker feature:
  // android.permission.BIND_ACCESSIBILITY_SERVICE
  // android.permission.PACKAGE_USAGE_STATS (for UsageStatsManager)
  // android.permission.RECEIVE_BOOT_COMPLETED (for persistent reminders)
  static const List<String> requiredPermissions = [
    'android.permission.SCHEDULE_EXACT_ALARM',
    'android.permission.POST_NOTIFICATIONS',
  ];

  static const List<String> optionalPermissions = [
    'android.permission.PACKAGE_USAGE_STATS',
    'android.permission.BIND_ACCESSIBILITY_SERVICE',
  ];
}
