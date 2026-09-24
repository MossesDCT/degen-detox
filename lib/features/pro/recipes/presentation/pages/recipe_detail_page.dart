import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/localization/app_localizations_helper.dart';
import '../../domain/entities/recipe.dart';
import '../../../../../core/theme/theme_helper.dart';

class RecipeDetailPage extends StatefulWidget {
  const RecipeDetailPage({super.key, required this.recipe});

  final Recipe recipe;

  @override
  State<RecipeDetailPage> createState() => _RecipeDetailPageState();
}

class _RecipeDetailPageState extends State<RecipeDetailPage> {
  final Set<int> _checkedIngredients = {};

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final recipe = widget.recipe;

    return Scaffold(
      backgroundColor: context.bg,
      body: CustomScrollView(
        slivers: [
          // Hero app bar
          SliverAppBar(
            expandedHeight: 200,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Container(
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                ),
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(height: 40),
                      Text(
                        recipe.emoji,
                        style: const TextStyle(fontSize: 64),
                      ),
                    ],
                  ),
                ),
              ),
              title: Text(recipe.name),
              titlePadding: const EdgeInsets.only(left: 56, bottom: 16),
            ),
            backgroundColor: AppColors.deepSage,
            foregroundColor: Colors.white,
          ),

          // Content
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Meta info
                  Row(
                    children: [
                      _MetaChip(
                          icon: Icons.timer_outlined,
                          label: recipe.totalTimeLabel),
                      const SizedBox(width: 8),
                      _MetaChip(
                          icon: Icons.people_outlined,
                          label: context.l10n.recipeServings(recipe.servings)),
                      const SizedBox(width: 8),
                      _MetaChip(
                          icon: Icons.restaurant_outlined,
                          label: recipe.categoryName),
                    ],
                  ).animate().fadeIn(duration: 400.ms),

                  const SizedBox(height: 16),

                  Text(
                    recipe.description,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: context.textSecondary,
                      height: 1.6,
                    ),
                  ).animate(delay: 100.ms).fadeIn(duration: 400.ms),

                  const SizedBox(height: 20),

                  // Benefits
                  _SectionTitle(
                      title: '✨ ' + context.l10n.recipeWhyItWorks,
                      icon: Icons.science_outlined),
                  const SizedBox(height: 10),
                  ...recipe.benefits.map((b) => Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Icon(Icons.check_circle_rounded,
                                color: AppColors.sageGreen, size: 16),
                            const SizedBox(width: 8),
                            Expanded(
                              child: Text(
                                b,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: context.textSecondary,
                                  height: 1.5,
                                ),
                              ),
                            ),
                          ],
                        ),
                      )),

                  const SizedBox(height: 20),

                  // Ingredients
                  _SectionTitle(
                      title: '🛒 ' + context.l10n.recipeIngredients,
                      icon: Icons.list_rounded),
                  const SizedBox(height: 10),
                  ...recipe.ingredients.asMap().entries.map((entry) {
                    final i = entry.key;
                    final ingredient = entry.value;
                    final isChecked = _checkedIngredients.contains(i);

                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          if (isChecked) {
                            _checkedIngredients.remove(i);
                          } else {
                            _checkedIngredients.add(i);
                          }
                        });
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 5),
                        child: Row(
                          children: [
                            AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              width: 22,
                              height: 22,
                              decoration: BoxDecoration(
                                color: isChecked
                                    ? AppColors.sageGreen
                                    : Colors.white,
                                borderRadius: BorderRadius.circular(6),
                                border: Border.all(
                                  color: isChecked
                                      ? AppColors.sageGreen
                                      : AppColors.divider,
                                ),
                              ),
                              child: isChecked
                                  ? const Icon(Icons.check_rounded,
                                      color: Colors.white, size: 14)
                                  : null,
                            ),
                            const SizedBox(width: 10),
                            Expanded(
                              child: Text(
                                ingredient,
                                style: theme.textTheme.bodyMedium?.copyWith(
                                  color: isChecked
                                      ? AppColors.textLight
                                      : AppColors.textPrimary,
                                  decoration: isChecked
                                      ? TextDecoration.lineThrough
                                      : null,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),

                  const SizedBox(height: 24),

                  // Instructions
                  _SectionTitle(
                      title: '👨‍🍳 ' + context.l10n.recipeInstructions,
                      icon: Icons.format_list_numbered_rounded),
                  const SizedBox(height: 12),
                  ...recipe.instructions.asMap().entries.map((entry) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: 28,
                            height: 28,
                            decoration: BoxDecoration(
                              color: AppColors.sageGreen,
                              shape: BoxShape.circle,
                            ),
                            child: Center(
                              child: Text(
                                '${entry.key + 1}',
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 13,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Text(
                              entry.value,
                              style: theme.textTheme.bodyMedium?.copyWith(
                                height: 1.5,
                                color: context.textPrimary,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }),

                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      children: [
        Icon(icon, color: AppColors.sageGreen, size: 20),
        const SizedBox(width: 8),
        Text(
          title,
          style: theme.textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _MetaChip extends StatelessWidget {
  const _MetaChip({required this.icon, required this.label});

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: context.dividerColor),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon, size: 13, color: context.textSecondary),
          const SizedBox(width: 4),
          Text(
            label,
            style: TextStyle(
              fontSize: 11,
              color: context.textSecondary,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
