import 'package:flutter/material.dart';
import 'degen/app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const DegenApp());
}

/// Compatibility type retained for unexposed legacy screens, not used by the
/// Degen Detox shell. Those screens remain provenance references pending audit.
class AppSettings extends InheritedWidget {
  const AppSettings(
      {super.key,
      required this.themeMode,
      required this.locale,
      required this.onThemeChanged,
      required this.onLocaleChanged,
      required super.child});
  final ThemeMode themeMode;
  final Locale locale;
  final ValueChanged<ThemeMode> onThemeChanged;
  final ValueChanged<Locale> onLocaleChanged;
  static AppSettings of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppSettings>()!;
  @override
  bool updateShouldNotify(AppSettings oldWidget) =>
      themeMode != oldWidget.themeMode || locale != oldWidget.locale;
}
