import 'package:flutter/material.dart';
import '../../l10n/generated/app_localizations.dart';

/// Extension on [BuildContext] for convenient localization access.
///
/// Usage:
/// ```dart
/// Text(context.l10n.appName)
/// Text(context.l10n.navHome)
/// ```
extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

/// Supported locales for the app.
const kSupportedLocales = [
  Locale('en'), // English
  Locale('es'), // Spanish
  Locale('fr'), // French
  Locale('lt'), // Lithuanian
];

/// Locale display names for the settings page.
const kLocaleDisplayNames = {
  'en': 'English',
  'es': 'Español',
  'fr': 'Français',
  'lt': 'Lietuvių',
};

/// Returns display name for a given locale code.
String localeDisplayName(String code) {
  return kLocaleDisplayNames[code] ?? code.toUpperCase();
}
