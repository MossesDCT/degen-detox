import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
// url_launcher will be used when URLs are configured
// import 'package:url_launcher/url_launcher.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/utils/purchase_manager.dart';
import '../../../../main.dart';
import '../../../../core/theme/theme_helper.dart';

/// App settings page.
class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _notificationsEnabled = true;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final appSettings = AppSettings.of(context);
    final isPro = PurchaseManager.instance.isProUser;

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(context.l10n.settingsTitle),
        backgroundColor: Colors.transparent,
      ),
      body: ListView(
        children: [
          _SectionHeader(title: context.l10n.appearance),
          _SettingsTile(
            icon: Icons.dark_mode_outlined,
            title: context.l10n.themeLabel,
            trailing: DropdownButton<ThemeMode>(
              value: appSettings.themeMode,
              underline: const SizedBox.shrink(),
              items: [
                DropdownMenuItem(
                    value: ThemeMode.system,
                    child: Text(context.l10n.themeSystem)),
                DropdownMenuItem(
                    value: ThemeMode.light,
                    child: Text(context.l10n.themeLight)),
                DropdownMenuItem(
                    value: ThemeMode.dark, child: Text(context.l10n.themeDark)),
              ],
              onChanged: (mode) async {
                if (mode == null) return;
                appSettings.onThemeChanged(mode);
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString(AppStrings.keyThemeMode, mode.name);
              },
            ),
          ),
          _SettingsTile(
            icon: Icons.language_outlined,
            title: context.l10n.language,
            trailing: DropdownButton<String>(
              value: appSettings.locale.languageCode,
              underline: const SizedBox.shrink(),
              items: const [
                DropdownMenuItem(value: 'de', child: Text('Deutsch')),
                DropdownMenuItem(value: 'en', child: Text('English')),
                DropdownMenuItem(value: 'es', child: Text('Español')),
                DropdownMenuItem(value: 'fr', child: Text('Français')),
                DropdownMenuItem(value: 'ko', child: Text('한국어')),
                DropdownMenuItem(value: 'lt', child: Text('Lietuvių')),
              ],
              onChanged: (code) async {
                if (code == null) return;
                appSettings.onLocaleChanged(Locale(code));
                final prefs = await SharedPreferences.getInstance();
                await prefs.setString(AppStrings.keyLanguageCode, code);
              },
            ),
          ),

          _SectionHeader(title: context.l10n.notifications),
          _SettingsTile(
            icon: Icons.notifications_outlined,
            title: context.l10n.enableNotifications,
            trailing: Switch(
              value: _notificationsEnabled,
              onChanged: (v) => setState(() => _notificationsEnabled = v),
            ),
          ),

          _SectionHeader(title: context.l10n.proTitle),
          _SettingsTile(
            icon: Icons.star_rounded,
            iconColor: AppColors.proBadge,
            title:
                isPro ? context.l10n.proActive : context.l10n.upgradeToProCTA,
            subtitle: isPro ? context.l10n.proThankYou : context.l10n.proPrice,
            onTap: isPro ? null : () => _navigateToUpgrade(context),
          ),
          if (!isPro)
            _SettingsTile(
              icon: Icons.restore_rounded,
              title: context.l10n.restorePurchases,
              onTap: () async {
                await PurchaseManager.instance.restorePurchases();
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text(context.l10n.checkingPurchases)),
                  );
                }
              },
            ),

          _SectionHeader(title: context.l10n.about),
          _SettingsTile(
            icon: Icons.privacy_tip_outlined,
            title: context.l10n.privacyPolicy,
            onTap: () => _launchUrl(AppStrings.privacyPolicyUrl),
          ),
          _SettingsTile(
            icon: Icons.description_outlined,
            title: context.l10n.termsOfService,
            onTap: () => _launchUrl(AppStrings.termsOfServiceUrl),
          ),
          _SettingsTile(
            icon: Icons.star_border_rounded,
            title: context.l10n.rateApp,
            onTap: () => _launchUrl(AppStrings.playStoreUrl),
          ),
          _SettingsTile(
            icon: Icons.info_outline_rounded,
            title: context.l10n.version,
            trailing: Text(
              AppStrings.appVersion,
              style: TextStyle(color: context.textSecondary),
            ),
          ),

          // ── Dev / Testing ──────────────────────────────────────────────
          _SectionHeader(title: '🛠 Dev Mode'),
          _SettingsTile(
            icon: Icons.bug_report_outlined,
            iconColor: Colors.orange,
            title: isPro ? 'PRO aktyvus ✓' : 'PRO neaktyvus',
            subtitle: 'Paspausti = perjungti PRO (testavimui)',
            onTap: () async {
              if (isPro) {
                await PurchaseManager.instance.revokePro();
              } else {
                await PurchaseManager.instance.grantProForDev();
              }
              if (context.mounted) setState(() {});
            },
          ),

          const SizedBox(height: 40),
        ],
      ),
    );
  }

  void _navigateToUpgrade(BuildContext context) {
    context.push(AppStrings.routeProUpgrade);
  }

  void _launchUrl(String url) async {
    // TODO: Use url_launcher package
    // await launchUrl(Uri.parse(url));
  }
}

class _SectionHeader extends StatelessWidget {
  const _SectionHeader({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 20, 20, 8),
      child: Text(
        title.toUpperCase(),
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w700,
          color: context.textLight,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.title,
    this.subtitle,
    this.trailing,
    this.onTap,
    this.iconColor,
  });

  final IconData icon;
  final String title;
  final String? subtitle;
  final Widget? trailing;
  final VoidCallback? onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      leading: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: (iconColor ?? AppColors.sageGreen).withOpacity(0.1),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon,
          color: iconColor ?? AppColors.sageGreen,
          size: 20,
        ),
      ),
      title: Text(
        title,
        style: theme.textTheme.bodyMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
      subtitle: subtitle != null
          ? Text(
              subtitle!,
              style: theme.textTheme.bodySmall?.copyWith(
                color: context.textSecondary,
              ),
            )
          : null,
      trailing: trailing ??
          (onTap != null
              ? Icon(Icons.chevron_right, color: context.textLight)
              : null),
      onTap: onTap,
    );
  }
}
