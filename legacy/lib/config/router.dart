import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../core/constants/app_strings.dart';
import '../core/localization/app_localizations_helper.dart';
import '../features/home/presentation/pages/home_page.dart';
import '../features/education/presentation/pages/education_page.dart';
import '../features/nutrition/presentation/pages/nutrition_page.dart';
import '../features/breathing/presentation/pages/breathing_page.dart';
import '../features/breathing/presentation/pages/breathing_session_page.dart';
import '../features/breathing/domain/entities/breathing_technique.dart';
import '../features/journal/presentation/pages/journal_page.dart';
import '../features/sleep_tracker/presentation/pages/sleep_tracker_page.dart';
import '../features/settings/presentation/pages/settings_page.dart';
import '../features/settings/presentation/pages/more_page.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/purchase/presentation/pages/pro_upgrade_page.dart';
import '../features/pro/recipes/presentation/pages/recipe_list_page.dart';
import '../features/pro/recipes/presentation/pages/recipe_detail_page.dart';
import '../features/pro/recipes/domain/entities/recipe.dart';
import '../features/pro/meditation/presentation/pages/meditation_library_page.dart';
import '../features/pro/app_blocker/presentation/pages/app_blocker_page.dart';
import '../features/pro/mood_ai/presentation/pages/mood_insights_page.dart';
import '../features/legal/presentation/pages/privacy_overview_page.dart';
import '../features/legal/presentation/pages/privacy_policy_page.dart';
import '../features/legal/presentation/pages/terms_page.dart';

/// Global navigator keys
final rootNavigatorKey = GlobalKey<NavigatorState>();
final shellNavigatorKey = GlobalKey<NavigatorState>();

/// Shell branches for bottom navigation
final homeNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'home');
final learnNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'learn');
final breatheNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'breathe');
final moreNavigatorKey = GlobalKey<NavigatorState>(debugLabel: 'more');

/// App router configuration using GoRouter with a bottom navigation shell.
final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppStrings.routeHome,
  redirect: _redirectLogic,
  routes: [
    // ── Onboarding (outside shell) ────────────────────────────────────────
    GoRoute(
      path: AppStrings.routeOnboarding,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const OnboardingPage(),
    ),

    // ── Privacy Overview (outside shell, after onboarding) ──────────────
    GoRoute(
      path: AppStrings.routePrivacyOverview,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const PrivacyOverviewPage(),
    ),

    // ── Legal pages (outside shell) ─────────────────────────────────
    GoRoute(
      path: AppStrings.routePrivacyPolicy,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const PrivacyPolicyPage(),
    ),
    GoRoute(
      path: AppStrings.routeTerms,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const TermsPage(),
    ),

    // ── PRO Upgrade (outside shell, full screen) ──────────────────────────
    GoRoute(
      path: AppStrings.routeProUpgrade,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) => const ProUpgradePage(),
    ),

    // ── Breathing Session (outside shell, full screen) ────────────────────
    GoRoute(
      path: AppStrings.routeBreathingSession,
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final technique = state.extra as BreathingTechnique?;
        return BreathingSessionPage(technique: technique);
      },
    ),

    // ── Recipe Detail (outside shell) ─────────────────────────────────────
    GoRoute(
      path: '/pro/recipes/detail',
      parentNavigatorKey: rootNavigatorKey,
      builder: (context, state) {
        final recipe = state.extra as Recipe;
        return RecipeDetailPage(recipe: recipe);
      },
    ),

    // ── Main Shell with Bottom Navigation ─────────────────────────────────
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return ScaffoldWithBottomNav(navigationShell: navigationShell);
      },
      branches: [
        // Home tab
        StatefulShellBranch(
          navigatorKey: homeNavigatorKey,
          routes: [
            GoRoute(
              path: AppStrings.routeHome,
              builder: (context, state) => const HomePage(),
            ),
          ],
        ),

        // Learn tab
        StatefulShellBranch(
          navigatorKey: learnNavigatorKey,
          routes: [
            GoRoute(
              path: AppStrings.routeLearn,
              builder: (context, state) => const EducationPage(),
              routes: [
                GoRoute(
                  path: 'nutrition',
                  builder: (context, state) => const NutritionPage(),
                ),
              ],
            ),
          ],
        ),

        // Breathe tab
        StatefulShellBranch(
          navigatorKey: breatheNavigatorKey,
          routes: [
            GoRoute(
              path: AppStrings.routeBreathe,
              builder: (context, state) => const BreathingPage(),
            ),
          ],
        ),

        // More tab
        StatefulShellBranch(
          navigatorKey: moreNavigatorKey,
          routes: [
            GoRoute(
              path: AppStrings.routeMore,
              builder: (context, state) => const MorePage(),
              routes: [
                GoRoute(
                  path: 'journal',
                  builder: (context, state) => const JournalPage(),
                ),
                GoRoute(
                  path: 'sleep',
                  builder: (context, state) => const SleepTrackerPage(),
                ),
                GoRoute(
                  path: 'settings',
                  builder: (context, state) => const SettingsPage(),
                ),
                GoRoute(
                  path: 'recipes',
                  builder: (context, state) => const RecipeListPage(),
                ),
                GoRoute(
                  path: 'meditation',
                  builder: (context, state) => const MeditationLibraryPage(),
                ),
                GoRoute(
                  path: 'app-blocker',
                  builder: (context, state) => const AppBlockerPage(),
                ),
                GoRoute(
                  path: 'mood-insights',
                  builder: (context, state) => const MoodInsightsPage(),
                ),
              ],
            ),
          ],
        ),
      ],
    ),
  ],
);

/// Redirect logic: show onboarding if first launch, then privacy overview.
Future<String?> _redirectLogic(
    BuildContext context, GoRouterState state) async {
  final prefs = await SharedPreferences.getInstance();
  final onboardingDone =
      prefs.getBool(AppStrings.keyOnboardingComplete) ?? false;
  final privacyAccepted = prefs.getBool(AppStrings.keyPrivacyAccepted) ?? false;

  final loc = state.matchedLocation;
  final isOnboardingRoute = loc == AppStrings.routeOnboarding;
  final isPrivacyOverviewRoute = loc == AppStrings.routePrivacyOverview;
  final isLegalRoute =
      loc == AppStrings.routePrivacyPolicy || loc == AppStrings.routeTerms;

  // Always allow legal pages
  if (isLegalRoute) return null;

  if (!onboardingDone && !isOnboardingRoute) {
    return AppStrings.routeOnboarding;
  }
  if (onboardingDone && isOnboardingRoute) {
    return privacyAccepted
        ? AppStrings.routeHome
        : AppStrings.routePrivacyOverview;
  }
  if (onboardingDone && !privacyAccepted && !isPrivacyOverviewRoute) {
    return AppStrings.routePrivacyOverview;
  }
  if (onboardingDone && privacyAccepted && isPrivacyOverviewRoute) {
    return AppStrings.routeHome;
  }
  return null;
}

/// Shell scaffold providing the bottom navigation bar.
class ScaffoldWithBottomNav extends StatelessWidget {
  const ScaffoldWithBottomNav({
    super.key,
    required this.navigationShell,
  });

  final StatefulNavigationShell navigationShell;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: navigationShell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: navigationShell.currentIndex,
        onDestinationSelected: (index) {
          navigationShell.goBranch(
            index,
            // Navigate to initial location when tapping active tab
            initialLocation: index == navigationShell.currentIndex,
          );
        },
        destinations: [
          NavigationDestination(
            icon: const Icon(Icons.home_outlined),
            selectedIcon: const Icon(Icons.home_rounded),
            label: context.l10n.navHome,
          ),
          NavigationDestination(
            icon: const Icon(Icons.menu_book_outlined),
            selectedIcon: const Icon(Icons.menu_book_rounded),
            label: context.l10n.navLearn,
          ),
          NavigationDestination(
            icon: const Icon(Icons.air_outlined),
            selectedIcon: const Icon(Icons.air_rounded),
            label: context.l10n.navBreathe,
          ),
          NavigationDestination(
            icon: const Icon(Icons.grid_view_outlined),
            selectedIcon: const Icon(Icons.grid_view_rounded),
            label: context.l10n.navMore,
          ),
        ],
      ),
    );
  }
}
