import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/utils/purchase_manager.dart';
import '../../../../core/widgets/pro_badge.dart';
import '../../../../core/theme/theme_helper.dart';

/// "More" tab combining access to Journal, Sleep, Settings, and PRO features.
class MorePage extends StatelessWidget {
  const MorePage({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isPro = PurchaseManager.instance.isProUser;

    return Scaffold(
      backgroundColor: context.bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Text(
                  context.l10n.moreTitle,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                  ),
                ).animate().fadeIn(duration: 400.ms),
              ),
            ),

            // PRO upgrade banner (if not pro)
            if (!isPro)
              SliverToBoxAdapter(
                child: _ProBanner(
                    onTap: () => context.push(AppStrings.routeProUpgrade)),
              ),

            // Free features
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Text(
                  context.l10n.toolsSection,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: context.textSecondary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  _MoreTile(
                    emoji: '📔',
                    title: context.l10n.journalTitle,
                    subtitle: context.l10n.moreJournalSub,
                    onTap: () =>
                        context.push('${AppStrings.routeMore}/journal'),
                  )
                      .animate(delay: 50.ms)
                      .fadeIn(duration: 350.ms)
                      .slideX(begin: 0.05),
                  _MoreTile(
                    emoji: '😴',
                    title: context.l10n.sleepTrackerTitle,
                    subtitle: context.l10n.moreSleepSub,
                    onTap: () => context.push('${AppStrings.routeMore}/sleep'),
                  )
                      .animate(delay: 100.ms)
                      .fadeIn(duration: 350.ms)
                      .slideX(begin: 0.05),
                  _MoreTile(
                    emoji: '⚙️',
                    title: context.l10n.settingsTitle,
                    subtitle: context.l10n.moreSettingsSub,
                    onTap: () =>
                        context.push('${AppStrings.routeMore}/settings'),
                  )
                      .animate(delay: 150.ms)
                      .fadeIn(duration: 350.ms)
                      .slideX(begin: 0.05),
                ],
              ),
            ),

            // PRO features
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  children: [
                    Text(
                      context.l10n.proFeaturesSection,
                      style: theme.textTheme.titleSmall?.copyWith(
                        color: context.textSecondary,
                        fontWeight: FontWeight.w700,
                        letterSpacing: 1,
                      ),
                    ),
                    const SizedBox(width: 8),
                    const ProBadge(),
                  ],
                ),
              ),
            ),

            // ── App Blocker – hero card (featured PRO tool) ──
            SliverToBoxAdapter(
              child: _AppBlockerHeroCard(
                isPro: isPro,
                onTap: () {
                  final p = PurchaseManager.instance.isProUser;
                  if (p) {
                    context.push('${AppStrings.routeMore}/app-blocker');
                  } else {
                    context.push(AppStrings.routeProUpgrade);
                  }
                },
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  _MoreTile(
                    emoji: '🍽️',
                    title: context.l10n.recipeBook,
                    subtitle: context.l10n.recipes22,
                    isProOnly: !isPro,
                    onTap: () {
                      final p = PurchaseManager.instance.isProUser;
                      if (p) {
                        context.push('${AppStrings.routeMore}/recipes');
                      } else {
                        context.push(AppStrings.routeProUpgrade);
                      }
                    },
                  ).animate(delay: 250.ms).fadeIn(duration: 350.ms),
                  _MoreTile(
                    emoji: '🧘',
                    title: context.l10n.meditationLibrary,
                    subtitle: context.l10n.guidedMeditations,
                    isProOnly: !isPro,
                    onTap: () {
                      final p = PurchaseManager.instance.isProUser;
                      if (p) {
                        context.push('${AppStrings.routeMore}/meditation');
                      } else {
                        context.push(AppStrings.routeProUpgrade);
                      }
                    },
                  ).animate(delay: 300.ms).fadeIn(duration: 350.ms),
                  _MoreTile(
                    emoji: '🤖',
                    title: context.l10n.moodInsights,
                    subtitle: context.l10n.weeklyPatternAnalysis,
                    isProOnly: !isPro,
                    onTap: () {
                      final p = PurchaseManager.instance.isProUser;
                      if (p) {
                        context.push('${AppStrings.routeMore}/mood-insights');
                      } else {
                        context.push(AppStrings.routeProUpgrade);
                      }
                    },
                  ).animate(delay: 350.ms).fadeIn(duration: 350.ms),
                ],
              ),
            ),

            // Legal section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Text(
                  context.l10n.legalSectionTitle,
                  style: theme.textTheme.titleSmall?.copyWith(
                    color: context.textSecondary,
                    fontWeight: FontWeight.w700,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),

            SliverToBoxAdapter(
              child: Column(
                children: [
                  _MoreTile(
                    emoji: '📄',
                    title: context.l10n.legalPrivacyPolicy,
                    subtitle: context.l10n.privacyOverviewLearnMore,
                    onTap: () => context.push('/legal/privacy-policy'),
                  ).animate(delay: 400.ms).fadeIn(duration: 350.ms),
                  _MoreTile(
                    emoji: '📋',
                    title: context.l10n.legalTermsOfService,
                    subtitle: context.l10n.privacyOverviewTerms,
                    onTap: () => context.push('/legal/terms'),
                  ).animate(delay: 450.ms).fadeIn(duration: 350.ms),
                ],
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        ),
      ),
    );
  }
}

class _ProBanner extends StatelessWidget {
  const _ProBanner({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [Color(0xFFD4AF37), Color(0xFFFFD700)],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: AppColors.proBadge.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            const Text('⭐', style: TextStyle(fontSize: 28)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.unlockCortisolZeroPro,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w800,
                    ),
                  ),
                  Text(
                    context.l10n.proBannerDescription,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.9),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
              decoration: BoxDecoration(
                color: context.cardBg,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Text(
                context.l10n.unlock,
                style: const TextStyle(
                  color: AppColors.proBadge,
                  fontWeight: FontWeight.w700,
                  fontSize: 13,
                ),
              ),
            ),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0);
  }
}

/// Premium hero card for App Blocker – the flagship PRO feature.
class _AppBlockerHeroCard extends StatelessWidget {
  const _AppBlockerHeroCard({required this.isPro, required this.onTap});

  final bool isPro;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: isDark
                ? [const Color(0xFF1B3A2D), const Color(0xFF2A4F3C)]
                : [const Color(0xFF2D5A3D), const Color(0xFF4A8C5E)],
          ),
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: const Color(0xFF2D5A3D).withOpacity(isDark ? 0.4 : 0.25),
              blurRadius: 16,
              offset: const Offset(0, 6),
            ),
          ],
        ),
        child: Row(
          children: [
            // Shield icon container
            Container(
              width: 52,
              height: 52,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.15),
                borderRadius: BorderRadius.circular(14),
              ),
              child: const Center(
                child: Text('🛡️', style: TextStyle(fontSize: 26)),
              ),
            ),
            const SizedBox(width: 14),
            // Title + subtitle
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          context.l10n.appBlocker,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 17,
                            fontWeight: FontWeight.w800,
                            letterSpacing: 0.3,
                          ),
                        ),
                      ),
                      if (!isPro) ...[
                        const SizedBox(width: 8),
                        const ProBadge(size: ProBadgeSize.mini),
                      ],
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    context.l10n.appBlockerSubtitle,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.8),
                      fontSize: 12.5,
                      height: 1.3,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(width: 8),
            Icon(
              Icons.chevron_right_rounded,
              color: Colors.white.withOpacity(0.7),
              size: 24,
            ),
          ],
        ),
      ),
    )
        .animate(delay: 200.ms)
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.08, end: 0);
  }
}

class _MoreTile extends StatelessWidget {
  const _MoreTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isProOnly = false,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isProOnly;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      leading: Container(
        width: 44,
        height: 44,
        decoration: BoxDecoration(
          color: context.surfaceBg,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: context.dividerColor),
        ),
        child: Center(
          child: Text(emoji, style: const TextStyle(fontSize: 22)),
        ),
      ),
      title: Row(
        children: [
          Text(
            title,
            style: theme.textTheme.bodyMedium?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          if (isProOnly) ...[
            const SizedBox(width: 8),
            const ProBadge(size: ProBadgeSize.mini),
          ],
        ],
      ),
      subtitle: Text(
        subtitle,
        style: theme.textTheme.bodySmall?.copyWith(
          color: context.textSecondary,
        ),
      ),
      trailing: Icon(Icons.chevron_right, color: context.textLight),
      onTap: onTap,
    );
  }
}
