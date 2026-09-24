import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../config/di.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/food_item.dart';
import '../bloc/nutrition_bloc.dart';
import '../widgets/food_card.dart';
import '../../../../core/theme/theme_helper.dart';

/// Anti-stress nutrition guide page.
class NutritionPage extends StatelessWidget {
  const NutritionPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<NutritionBloc>(),
      child: const _NutritionView(),
    );
  }
}

class _Filter {
  const _Filter({
    required this.label,
    required this.category,
    required this.emoji,
  });

  final String label;
  final FoodCategory? category;
  final String emoji;
}

class _NutritionView extends StatefulWidget {
  const _NutritionView();

  @override
  State<_NutritionView> createState() => _NutritionViewState();
}

class _NutritionViewState extends State<_NutritionView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load nutrition data with the current locale every time locale changes
    context.read<NutritionBloc>().add(
          LoadNutritionGuide(l10n: AppLocalizations.of(context)),
        );
  }

  List<_Filter> _buildFilters(BuildContext context) {
    final l = context.l10n;
    return [
      _Filter(label: l.nutFilterAll, category: null, emoji: '🥗'),
      _Filter(
          label: l.nutFilterFruits, category: FoodCategory.fruits, emoji: '🍎'),
      _Filter(
          label: l.nutFilterVegetables,
          category: FoodCategory.vegetables,
          emoji: '🥦'),
      _Filter(
          label: l.nutFilterProteins,
          category: FoodCategory.proteins,
          emoji: '🐟'),
      _Filter(
          label: l.nutFilterBeverages,
          category: FoodCategory.beverages,
          emoji: '🍵'),
      _Filter(
          label: l.nutFilterNutsSeeds,
          category: FoodCategory.nutsAndSeeds,
          emoji: '🌰'),
      _Filter(
          label: l.nutFilterGrains, category: FoodCategory.grains, emoji: '🌾'),
      _Filter(
          label: l.nutFilterDairy, category: FoodCategory.dairy, emoji: '🥛'),
      _Filter(
          label: l.nutFilterSpices, category: FoodCategory.spices, emoji: '🟡'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final filters = _buildFilters(context);

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(context.l10n.nutritionGuide),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Hero banner
          Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: AppColors.primaryGradient,
              borderRadius: BorderRadius.circular(16),
            ),
            child: Row(
              children: [
                const Text('🥗', style: TextStyle(fontSize: 40)),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        context.l10n.antiStressFoods,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 17,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                      Text(
                        context.l10n.tapToLearnScience,
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.85),
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ).animate().fadeIn(duration: 400.ms).slideY(begin: -0.1, end: 0),

          // Category filters
          BlocBuilder<NutritionBloc, NutritionState>(
            builder: (context, state) {
              final selected =
                  state is NutritionLoaded ? state.selectedCategory : null;
              return SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: filters.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final filter = filters[index];
                    final isSelected = filter.category == selected;
                    return GestureDetector(
                      onTap: () => context
                          .read<NutritionBloc>()
                          .add(FilterFoodByCategory(filter.category)),
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12, vertical: 8),
                        decoration: BoxDecoration(
                          color:
                              isSelected ? AppColors.sageGreen : context.cardBg,
                          borderRadius: BorderRadius.circular(20),
                          border: Border.all(
                            color: isSelected
                                ? AppColors.sageGreen
                                : AppColors.divider,
                          ),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(filter.emoji,
                                style: const TextStyle(fontSize: 13)),
                            const SizedBox(width: 4),
                            Text(
                              filter.label,
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                color: isSelected
                                    ? Colors.white
                                    : AppColors.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),

          const SizedBox(height: 8),

          // Food list
          Expanded(
            child: BlocBuilder<NutritionBloc, NutritionState>(
              builder: (context, state) {
                if (state is NutritionLoading) {
                  return const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.sageGreen),
                  );
                }
                if (state is NutritionLoaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 4, bottom: 24),
                    itemCount: state.foods.length,
                    itemBuilder: (context, index) {
                      return FoodCard(
                        food: state.foods[index],
                        animationDelay: Duration(milliseconds: 50 * index),
                      );
                    },
                  );
                }
                return const SizedBox.shrink();
              },
            ),
          ),
        ],
      ),
    );
  }
}
