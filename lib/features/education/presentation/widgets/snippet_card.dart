import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../domain/entities/education_snippet.dart';
import '../../../../core/theme/theme_helper.dart';

/// Individual education snippet card with expand/collapse behavior.
class SnippetCard extends StatefulWidget {
  const SnippetCard({
    super.key,
    required this.snippet,
    this.animationDelay = Duration.zero,
  });

  final EducationSnippet snippet;
  final Duration animationDelay;

  @override
  State<SnippetCard> createState() => _SnippetCardState();
}

class _SnippetCardState extends State<SnippetCard>
    with SingleTickerProviderStateMixin {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final snippet = widget.snippet;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      decoration: BoxDecoration(
        color: snippet.isHighlighted
            ? AppColors.lightSage.withOpacity(0.4)
            : Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: snippet.isHighlighted
            ? Border.all(color: AppColors.sageGreen.withOpacity(0.4), width: 1)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(context.shadowOpacity),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(16),
        child: InkWell(
          onTap: () => setState(() => _isExpanded = !_isExpanded),
          borderRadius: BorderRadius.circular(16),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    if (snippet.emoji != null) ...[
                      Text(snippet.emoji!,
                          style: const TextStyle(fontSize: 24)),
                      const SizedBox(width: 10),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            snippet.title,
                            style: theme.textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.w700,
                              color: context.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Row(
                            children: [
                              Container(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 8, vertical: 2),
                                decoration: BoxDecoration(
                                  color: _getCategoryColor(snippet.category)
                                      .withOpacity(0.15),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  _getLocalizedCategoryName(
                                      context, snippet.category),
                                  style: TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: _getCategoryColor(snippet.category),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 8),
                              Icon(Icons.access_time,
                                  size: 12, color: context.textLight),
                              const SizedBox(width: 3),
                              Text(
                                context.l10n
                                    .minRead(snippet.readingTimeMinutes),
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
                    AnimatedRotation(
                      turns: _isExpanded ? 0.5 : 0,
                      duration: const Duration(milliseconds: 200),
                      child: Icon(
                        Icons.keyboard_arrow_down_rounded,
                        color: context.textSecondary,
                      ),
                    ),
                  ],
                ),
                if (!_isExpanded) ...[
                  const SizedBox(height: 8),
                  Text(
                    snippet.content,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: context.textSecondary,
                    ),
                  ),
                ],
                AnimatedCrossFade(
                  firstChild: const SizedBox.shrink(),
                  secondChild: Padding(
                    padding: const EdgeInsets.only(top: 12),
                    child: Text(
                      snippet.content,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: context.textSecondary,
                        height: 1.6,
                      ),
                    ),
                  ),
                  crossFadeState: _isExpanded
                      ? CrossFadeState.showSecond
                      : CrossFadeState.showFirst,
                  duration: const Duration(milliseconds: 250),
                ),
              ],
            ),
          ),
        ),
      ),
    )
        .animate(delay: widget.animationDelay)
        .fadeIn(duration: const Duration(milliseconds: 400))
        .slideY(
            begin: 0.1, end: 0, duration: const Duration(milliseconds: 400));
  }

  String _getLocalizedCategoryName(
      BuildContext context, SnippetCategory category) {
    final l = context.l10n;
    switch (category) {
      case SnippetCategory.basics:
        return l.catBasics;
      case SnippetCategory.science:
        return l.catScience;
      case SnippetCategory.impact:
        return l.catImpact;
      case SnippetCategory.reduction:
        return l.catReduction;
      case SnippetCategory.lifestyle:
        return l.catLifestyle;
      case SnippetCategory.nutrition:
        return l.catNutrition;
      case SnippetCategory.sleep:
        return l.catSleep;
      case SnippetCategory.exercise:
        return l.catExercise;
      case SnippetCategory.mindfulness:
        return l.catMindfulness;
    }
  }

  Color _getCategoryColor(SnippetCategory category) {
    switch (category) {
      case SnippetCategory.basics:
        return AppColors.sageGreen;
      case SnippetCategory.science:
        return AppColors.oceanBlue;
      case SnippetCategory.impact:
        return AppColors.error;
      case SnippetCategory.reduction:
        return AppColors.mintGreen;
      case SnippetCategory.lifestyle:
        return AppColors.deepLavender;
      case SnippetCategory.nutrition:
        return AppColors.warning;
      case SnippetCategory.sleep:
        return AppColors.skyBlue;
      case SnippetCategory.exercise:
        return AppColors.success;
      case SnippetCategory.mindfulness:
        return AppColors.lilac;
    }
  }
}
