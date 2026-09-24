import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/theme/theme_helper.dart';

/// Individual onboarding page content widget.
class OnboardingContent extends StatelessWidget {
  const OnboardingContent({
    super.key,
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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      color: backgroundColor,
      padding: const EdgeInsets.fromLTRB(32, 60, 32, 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Illustration placeholder / emoji
          Container(
            width: 140,
            height: 140,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.6),
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.08),
                  blurRadius: 24,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: Center(
              child: Text(emoji, style: const TextStyle(fontSize: 64)),
            ),
          )
              .animate()
              .scale(
                  duration: 600.ms,
                  curve: Curves.elasticOut,
                  begin: const Offset(0.5, 0.5))
              .fadeIn(duration: 400.ms),

          const SizedBox(height: 40),

          Text(
            title,
            textAlign: TextAlign.center,
            style: theme.textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.w800,
              color: context.textPrimary,
              height: 1.2,
            ),
          )
              .animate(delay: 200.ms)
              .fadeIn(duration: 400.ms)
              .slideY(begin: 0.2, end: 0),

          const SizedBox(height: 16),

          Text(
            subtitle,
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyLarge?.copyWith(
              color: context.textSecondary,
              height: 1.6,
            ),
          ).animate(delay: 300.ms).fadeIn(duration: 400.ms),

          const SizedBox(height: 32),

          // Feature highlights
          // Features starting with ⭐ get a gold background and bold text
          ...features.asMap().entries.map((entry) {
            final text = entry.value;
            final isStarred = text.startsWith('⭐');
            final displayText = isStarred ? text.substring(1).trim() : text;

            return Padding(
              padding: const EdgeInsets.only(bottom: 12),
              child: Container(
                decoration: isStarred
                    ? BoxDecoration(
                        color: const Color(0xFFFFF8E1),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: const Color(0xFFFFD54F),
                          width: 1.2,
                        ),
                      )
                    : null,
                padding: isStarred
                    ? const EdgeInsets.symmetric(horizontal: 10, vertical: 4)
                    : EdgeInsets.zero,
                child: Row(
                  children: [
                    Container(
                      width: 28,
                      height: 28,
                      decoration: BoxDecoration(
                        color: isStarred
                            ? const Color(0xFFFFD54F).withOpacity(0.3)
                            : AppColors.sageGreen.withOpacity(0.15),
                        shape: BoxShape.circle,
                      ),
                      child: Center(
                        child: isStarred
                            ? const Text('⭐', style: TextStyle(fontSize: 14))
                            : const Icon(Icons.check_rounded,
                                size: 16, color: AppColors.sageGreen),
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        displayText,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: isStarred
                              ? const Color(0xFF7A5500)
                              : context.textSecondary,
                          fontWeight:
                              isStarred ? FontWeight.w700 : FontWeight.normal,
                        ),
                      ),
                    ),
                  ],
                ),
              )
                  .animate(
                      delay: Duration(milliseconds: 400 + (100 * entry.key)))
                  .fadeIn(duration: 350.ms)
                  .slideX(begin: 0.1, end: 0),
            );
          }),
        ],
      ),
    );
  }
}
