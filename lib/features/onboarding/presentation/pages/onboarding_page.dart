import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../widgets/onboarding_content.dart';
import '../../../../core/theme/theme_helper.dart';

/// 3-screen onboarding experience.
class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  List<_OnboardingData> _pages(BuildContext context) => [
        _OnboardingData(
          emoji: '🌿',
          title: context.l10n.onboarding1Title,
          subtitle: context.l10n.onboarding1Subtitle,
          features: const [
            'Science-backed stress reduction techniques',
            'Interactive breathing exercises',
            'Track your mood and sleep quality',
          ],
          backgroundColor: const Color(0xFFF0F7F0),
        ),
        _OnboardingData(
          emoji: '🧬',
          title: context.l10n.onboarding2Title,
          subtitle: context.l10n.onboarding2Subtitle,
          features: const [
            'Chronic stress keeps cortisol dangerously high',
            'Affects weight, sleep, immunity, and focus',
            'Modern lifestyle dysregulates the stress cycle',
            'Science has proven natural remedies work',
          ],
          backgroundColor: const Color(0xFFF0F4F8),
        ),
        _OnboardingData(
          emoji: '🎯',
          title: context.l10n.onboarding3Title,
          subtitle: context.l10n.onboarding3Subtitle,
          features: const [
            '⭐ App Blocker — block stress apps every morning',
            '3 breathing techniques for instant relief',
            'Daily mood journal with insights',
            'Anti-stress nutrition guide',
          ],
          backgroundColor: const Color(0xFFFAF5FF),
        ),
      ];

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onNext() {
    if (_currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 400),
        curve: Curves.easeInOutCubic,
      );
    } else {
      _completeOnboarding();
    }
  }

  Future<void> _completeOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(AppStrings.keyOnboardingComplete, true);
    if (mounted) {
      context.go(AppStrings.routeHome);
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = _pages(context);
    final isLastPage = _currentPage == pages.length - 1;

    return Scaffold(
      body: Stack(
        children: [
          // Page view
          PageView.builder(
            controller: _pageController,
            onPageChanged: (i) => setState(() => _currentPage = i),
            itemCount: pages.length,
            itemBuilder: (context, index) {
              final page = pages[index];
              return OnboardingContent(
                emoji: page.emoji,
                title: page.title,
                subtitle: page.subtitle,
                features: page.features,
                backgroundColor: page.backgroundColor,
              );
            },
          ),

          // Bottom navigation
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: Container(
              padding: const EdgeInsets.fromLTRB(32, 20, 32, 48),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    pages[_currentPage].backgroundColor.withOpacity(0),
                    pages[_currentPage].backgroundColor,
                  ],
                ),
              ),
              child: Column(
                children: [
                  // Page indicators
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(pages.length, (i) {
                      return AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: i == _currentPage ? 24 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                          color: i == _currentPage
                              ? AppColors.sageGreen
                              : AppColors.divider,
                          borderRadius: BorderRadius.circular(4),
                        ),
                      );
                    }),
                  ),

                  const SizedBox(height: 24),

                  // CTA Button
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: _onNext,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.sageGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 18),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        elevation: 0,
                      ),
                      child: Text(
                        isLastPage
                            ? context.l10n.getStarted
                            : context.l10n.continueButton,
                        style: const TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ),

                  if (!isLastPage) ...[
                    const SizedBox(height: 12),
                    TextButton(
                      onPressed: _completeOnboarding,
                      child: Text(
                        context.l10n.skip,
                        style: TextStyle(
                          color: context.textLight,
                          fontSize: 14,
                        ),
                      ),
                    ),
                  ],
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _OnboardingData {
  const _OnboardingData({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.features,
    required this.backgroundColor,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final List<String> features;
  final Color backgroundColor;
}
