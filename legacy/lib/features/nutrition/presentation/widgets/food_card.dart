import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/food_item.dart';
import '../../../../core/theme/theme_helper.dart';

/// Card widget for a single anti-stress food item.
class FoodCard extends StatefulWidget {
  const FoodCard({
    super.key,
    required this.food,
    this.animationDelay = Duration.zero,
  });

  final FoodItem food;
  final Duration animationDelay;

  @override
  State<FoodCard> createState() => _FoodCardState();
}

class _FoodCardState extends State<FoodCard> {
  bool _expanded = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final food = widget.food;

    return GestureDetector(
      onTap: () => setState(() => _expanded = !_expanded),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        decoration: BoxDecoration(
          color: context.cardBg,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(context.shadowOpacity),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  // Emoji icon
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: _categoryColor(food.category).withOpacity(0.12),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Center(
                      child: Text(
                        food.emoji,
                        style: const TextStyle(fontSize: 24),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: Text(
                                food.name,
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: context.textPrimary,
                                ),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: _categoryColor(food.category)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Text(
                                _localizedCategoryName(
                                    context.l10n, food.category),
                                style: TextStyle(
                                  fontSize: 10,
                                  fontWeight: FontWeight.w600,
                                  color: _categoryColor(food.category),
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 4),
                        Text(
                          food.keyBenefit,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: context.textSecondary,
                          ),
                          maxLines: _expanded ? null : 1,
                          overflow: _expanded
                              ? TextOverflow.visible
                              : TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),

                  AnimatedRotation(
                    turns: _expanded ? 0.5 : 0,
                    duration: const Duration(milliseconds: 200),
                    child: Icon(
                      Icons.keyboard_arrow_down_rounded,
                      color: context.textLight,
                      size: 20,
                    ),
                  ),
                ],
              ),

              // Expanded content
              AnimatedCrossFade(
                firstChild: const SizedBox.shrink(),
                secondChild: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Divider(height: 20),

                    // Mechanism
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Icon(Icons.science_outlined,
                            size: 16, color: AppColors.oceanBlue),
                        const SizedBox(width: 6),
                        Expanded(
                          child: Text(
                            food.mechanism,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textSecondary,
                              height: 1.5,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 10),

                    // Serving idea
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: AppColors.lightSage.withOpacity(0.3),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.restaurant,
                              size: 14, color: AppColors.sageGreen),
                          const SizedBox(width: 6),
                          Expanded(
                            child: Text(
                              food.servingIdea,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: AppColors.deepSage,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Nutrients
                    if (food.nutrients.isNotEmpty) ...[
                      const SizedBox(height: 10),
                      Wrap(
                        spacing: 6,
                        runSpacing: 4,
                        children: food.nutrients.map((n) {
                          return Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 8, vertical: 3),
                            decoration: BoxDecoration(
                              color: AppColors.lavender.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Text(
                              n,
                              style: const TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                                color: AppColors.deepLavender,
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
                crossFadeState: _expanded
                    ? CrossFadeState.showSecond
                    : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 300),
              ),
            ],
          ),
        ),
      ),
    )
        .animate(delay: widget.animationDelay)
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.08, end: 0);
  }

  String _localizedCategoryName(AppLocalizations l, FoodCategory category) {
    switch (category) {
      case FoodCategory.fruits:
        return l.nutCatFruits;
      case FoodCategory.vegetables:
        return l.nutCatVegetables;
      case FoodCategory.proteins:
        return l.nutCatProteins;
      case FoodCategory.beverages:
        return l.nutCatBeverages;
      case FoodCategory.nutsAndSeeds:
        return l.nutCatNutsSeeds;
      case FoodCategory.grains:
        return l.nutCatGrains;
      case FoodCategory.dairy:
        return l.nutCatDairy;
      case FoodCategory.spices:
        return l.nutCatSpices;
    }
  }

  Color _categoryColor(FoodCategory category) {
    switch (category) {
      case FoodCategory.fruits:
        return Colors.orange;
      case FoodCategory.vegetables:
        return AppColors.sageGreen;
      case FoodCategory.proteins:
        return AppColors.oceanBlue;
      case FoodCategory.beverages:
        return const Color(0xFF4CAF50);
      case FoodCategory.nutsAndSeeds:
        return Colors.brown;
      case FoodCategory.grains:
        return Colors.amber;
      case FoodCategory.dairy:
        return Colors.lightBlue;
      case FoodCategory.spices:
        return Colors.deepOrange;
    }
  }
}
