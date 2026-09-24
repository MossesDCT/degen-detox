import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/widgets/section_header.dart';
import '../widgets/daily_tip_card.dart';
import '../widgets/mood_checkin_widget.dart';
import '../widgets/quick_action_button.dart';
import '../../../../core/theme/theme_helper.dart';

/// Home screen with greeting, daily tip, quick actions, and mood check-in.
class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _streak = 0;
  int _tipIndex = 0;
  static const int _tipCount = 14;

  String _getDailyTip(BuildContext context) {
    final l = context.l10n;
    final tips = [
      l.dailyTip0,
      l.dailyTip1,
      l.dailyTip2,
      l.dailyTip3,
      l.dailyTip4,
      l.dailyTip5,
      l.dailyTip6,
      l.dailyTip7,
      l.dailyTip8,
      l.dailyTip9,
      l.dailyTip10,
      l.dailyTip11,
      l.dailyTip12,
      l.dailyTip13,
    ];
    return tips[_tipIndex];
  }

  @override
  void initState() {
    super.initState();
    _loadStreak();
    _tipIndex = DateTime.now().day % _tipCount;
  }

  Future<void> _loadStreak() async {
    final prefs = await SharedPreferences.getInstance();
    final lastOpen = prefs.getString(AppStrings.keyLastOpenDate);
    final today = DateTime.now().toIso8601String().substring(0, 10);
    int streak = prefs.getInt(AppStrings.keyDailyStreak) ?? 0;

    if (lastOpen != null) {
      final lastDate = DateTime.parse(lastOpen);
      final daysDiff = DateTime.now().difference(lastDate).inDays;

      if (daysDiff == 1) {
        streak++;
      } else if (daysDiff > 1) {
        streak = 1;
      }
    } else {
      streak = 1;
    }

    await prefs.setInt(AppStrings.keyDailyStreak, streak);
    await prefs.setString(AppStrings.keyLastOpenDate, today);

    if (mounted) {
      setState(() => _streak = streak);
    }
  }

  String _greeting(BuildContext context) {
    final hour = DateTime.now().hour;
    if (hour < 12) return context.l10n.greetingMorning;
    if (hour < 17) return context.l10n.greetingAfternoon;
    if (hour < 21) return context.l10n.greetingEvening;
    return context.l10n.greetingNight;
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: context.bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          _greeting(context),
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: context.textSecondary,
                          ),
                        ).animate().fadeIn(duration: 400.ms),
                        Text(
                          AppStrings.appName,
                          style: theme.textTheme.headlineMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: context.textPrimary,
                          ),
                        ).animate(delay: 50.ms).fadeIn(duration: 400.ms),
                      ],
                    ),

                    // Streak counter
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 12, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.warmCream,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: context.dividerColor),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text('🔥', style: TextStyle(fontSize: 18)),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '$_streak',
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w800,
                                  color: context.textPrimary,
                                ),
                              ),
                              Text(
                                context.l10n.dayStreak,
                                style: TextStyle(
                                  fontSize: 9,
                                  color: context.textSecondary,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ).animate(delay: 100.ms).fadeIn(duration: 400.ms),
                  ],
                ),
              ),
            ),

            // Daily tip
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: context.l10n.dailyTip,
                    padding: const EdgeInsets.fromLTRB(20, 16, 20, 8),
                  ),
                  DailyTipCard(tip: _getDailyTip(context)),
                ],
              ),
            ),

            // Quick actions
            SliverToBoxAdapter(
              child: Column(
                children: [
                  SectionHeader(
                    title: context.l10n.quickAccess,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QuickActionButton(
                          emoji: '🌬️',
                          label: context.l10n.navBreathe,
                          color: AppColors.skyBlue,
                          animationDelay: const Duration(milliseconds: 100),
                          onTap: () => context.go(AppStrings.routeBreathe),
                        ),
                        QuickActionButton(
                          emoji: '📚',
                          label: context.l10n.navLearn,
                          color: AppColors.sageGreen,
                          animationDelay: const Duration(milliseconds: 200),
                          onTap: () => context.go(AppStrings.routeLearn),
                        ),
                        QuickActionButton(
                          emoji: '📔',
                          label: context.l10n.journalLabel,
                          color: AppColors.warning,
                          animationDelay: const Duration(milliseconds: 250),
                          onTap: () =>
                              context.push('${AppStrings.routeMore}/journal'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Mood check-in
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: context.l10n.moodCheckin,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  ),
                  const MoodCheckinWidget(),
                ],
              ),
            ),

            // Feature highlight tiles
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SectionHeader(
                    title: context.l10n.explore,
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 12),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      children: [
                        Expanded(
                          child: _FeatureTile(
                            emoji: '🥗',
                            title: context.l10n.featureNutrition,
                            subtitle: context.l10n.featureNutritionSub,
                            gradient: AppColors.primaryGradient,
                            onTap: () =>
                                context.push(AppStrings.routeNutrition),
                          ),
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: _FeatureTile(
                            emoji: '😴',
                            title: context.l10n.featureSleep,
                            subtitle: context.l10n.featureSleepSub,
                            gradient: AppColors.calmGradient,
                            onTap: () =>
                                context.push('${AppStrings.routeMore}/sleep'),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 32)),
          ],
        ),
      ),
    );
  }
}

class _FeatureTile extends StatelessWidget {
  const _FeatureTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.gradient,
    required this.onTap,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final Gradient gradient;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: gradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(emoji, style: const TextStyle(fontSize: 28)),
            const SizedBox(height: 8),
            Text(
              title,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.white.withOpacity(0.8),
                fontSize: 11,
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: 400.ms)
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.1, end: 0);
  }
}
