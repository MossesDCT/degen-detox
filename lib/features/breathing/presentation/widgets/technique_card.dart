import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../domain/entities/breathing_technique.dart';
import '../../../../core/theme/theme_helper.dart';

/// Card for selecting a breathing technique.
class TechniqueCard extends StatelessWidget {
  const TechniqueCard({
    super.key,
    required this.technique,
    required this.onTap,
    this.animationDelay = Duration.zero,
  });

  final BreathingTechnique technique;
  final VoidCallback onTap;
  final Duration animationDelay;

  String _localizedDifficulty(BuildContext context) {
    final l = context.l10n;
    switch (technique.difficultyLevel) {
      case 1:
        return l.beginner;
      case 2:
        return l.intermediate;
      case 3:
        return l.advanced;
      default:
        return l.beginner;
    }
  }

  String _localizedDuration(BuildContext context) {
    final l = context.l10n;
    final total = technique.sessionDurationSeconds;
    if (total < 60) return '$total ${l.durationSec}';
    final min = total ~/ 60;
    final sec = total % 60;
    return sec == 0
        ? '$min ${l.durationMin}'
        : '$min ${l.durationMin} $sec ${l.durationSec}';
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
        decoration: BoxDecoration(
          color: context.cardBg,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: technique.primaryColor.withOpacity(0.15),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Row(
          children: [
            // Left color accent
            Container(
              width: 6,
              height: 120,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [technique.primaryColor, technique.secondaryColor],
                ),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                ),
              ),
            ),

            // Content
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(technique.emoji,
                            style: const TextStyle(fontSize: 28)),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                technique.name,
                                style: theme.textTheme.titleMedium?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.textPrimary,
                                ),
                              ),
                              Row(
                                children: [
                                  _DifficultyBadge(
                                      level: technique.difficultyLevel,
                                      label: _localizedDifficulty(context)),
                                  const SizedBox(width: 8),
                                  Icon(Icons.access_time,
                                      size: 12, color: context.textLight),
                                  const SizedBox(width: 3),
                                  Text(
                                    _localizedDuration(context),
                                    style: TextStyle(
                                      fontSize: 11,
                                      color: context.textLight,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                        Icon(Icons.play_circle_filled_rounded,
                            color: technique.primaryColor, size: 36),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      technique.description,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: context.textSecondary,
                        height: 1.4,
                      ),
                    ),
                    const SizedBox(height: 8),
                    // Phase preview
                    Wrap(
                      spacing: 6,
                      runSpacing: 4,
                      children: technique.phases.map((phase) {
                        return Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 8, vertical: 3),
                          decoration: BoxDecoration(
                            color: technique.primaryColor.withOpacity(0.08),
                            borderRadius: BorderRadius.circular(8),
                            border: Border.all(
                              color: technique.primaryColor.withOpacity(0.2),
                            ),
                          ),
                          child: Text(
                            '${phase.name} ${phase.durationSeconds}s',
                            style: TextStyle(
                              fontSize: 10,
                              color: technique.primaryColor,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: animationDelay)
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.1, end: 0);
  }
}

class _DifficultyBadge extends StatelessWidget {
  const _DifficultyBadge({required this.level, required this.label});

  final int level;
  final String label;

  Color get _color {
    switch (level) {
      case 1:
        return AppColors.success;
      case 2:
        return AppColors.warning;
      case 3:
        return AppColors.error;
      default:
        return AppColors.success;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: _color.withOpacity(0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.w700,
          color: _color,
        ),
      ),
    );
  }
}
