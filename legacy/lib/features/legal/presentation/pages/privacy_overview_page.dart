import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Privacy overview screen shown ONCE after onboarding, before any permissions
/// are requested. Explains data handling and obtains user acceptance.
///
/// Saves [AppStrings.keyPrivacyAccepted] = true to SharedPreferences on accept.
class PrivacyOverviewPage extends StatelessWidget {
  const PrivacyOverviewPage({super.key});

  Future<void> _accept(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppStrings.keyPrivacyAccepted, true);
    if (context.mounted) {
      context.go(AppStrings.routeHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: context.bg,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(24, 32, 24, 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Shield illustration
              Container(
                width: 96,
                height: 96,
                decoration: BoxDecoration(
                  color: AppColors.sageGreen.withOpacity(0.12),
                  shape: BoxShape.circle,
                ),
                child: const Center(
                  child: Text('🛡️', style: TextStyle(fontSize: 48)),
                ),
              ),
              const SizedBox(height: 24),

              // Title
              Text(
                context.l10n.privacyOverviewTitle,
                textAlign: TextAlign.center,
                style: theme.textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.w800,
                  color: context.textPrimary,
                ),
              ),
              const SizedBox(height: 20),

              // Key points card
              Container(
                decoration: BoxDecoration(
                  color: context.cardBg,
                  borderRadius: BorderRadius.circular(16),
                  border: Border.all(
                    color: AppColors.sageGreen.withOpacity(0.2),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.04),
                      blurRadius: 8,
                      offset: const Offset(0, 2),
                    ),
                  ],
                ),
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    _PointRow(
                      icon: Icons.phone_android_rounded,
                      iconColor: AppColors.sageGreen,
                      text: 'We need 3 permissions to block apps',
                    ),
                    const SizedBox(height: 14),
                    _PointRow(
                      icon: Icons.lock_rounded,
                      iconColor: AppColors.sageGreen,
                      text: 'All processing is LOCAL on your device',
                    ),
                    const SizedBox(height: 14),
                    _PointRow(
                      icon: Icons.cloud_off_rounded,
                      iconColor: Colors.redAccent,
                      text:
                          'We do NOT collect, store, or send any data to servers',
                    ),
                    const SizedBox(height: 14),
                    _PointRow(
                      icon: Icons.person_off_rounded,
                      iconColor: Colors.redAccent,
                      text: 'We do NOT have user accounts or analytics',
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),

              // Body text
              Text(
                context.l10n.privacyOverviewBody,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyMedium?.copyWith(
                  color: context.textSecondary,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),

              // Accept button
              SizedBox(
                width: double.infinity,
                height: 54,
                child: ElevatedButton(
                  onPressed: () => _accept(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.sageGreen,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 0,
                  ),
                  child: Text(
                    context.l10n.privacyOverviewAccept,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 16),

              // Legal links row
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () =>
                        context.push(AppStrings.routePrivacyPolicy),
                    child: Text(
                      context.l10n.privacyOverviewLearnMore,
                      style: TextStyle(
                        color: AppColors.sageGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Text(
                    ' · ',
                    style: TextStyle(color: context.textLight),
                  ),
                  TextButton(
                    onPressed: () => context.push(AppStrings.routeTerms),
                    child: Text(
                      context.l10n.privacyOverviewTerms,
                      style: TextStyle(
                        color: AppColors.sageGreen,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _PointRow extends StatelessWidget {
  const _PointRow({
    required this.icon,
    required this.iconColor,
    required this.text,
  });

  final IconData icon;
  final Color iconColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, color: iconColor, size: 20),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: context.textPrimary,
              height: 1.4,
            ),
          ),
        ),
      ],
    );
  }
}
