import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/localization/app_localizations_helper.dart';
import '../../domain/entities/recipe.dart';
import '../bloc/recipe_bloc.dart';
import '../widgets/recipe_card.dart';
import 'recipe_detail_page.dart';
import '../../../../../core/theme/theme_helper.dart';

class RecipeListPage extends StatelessWidget {
  const RecipeListPage({super.key});

  static List<_Filter> filtersFor(BuildContext context) {
    final l = context.l10n;
    return [
      _Filter(label: l.filterAll, category: null, emoji: '🍽️'),
      _Filter(
          label: l.filterBreakfast,
          category: RecipeCategory.breakfast,
          emoji: '🌅'),
      _Filter(
          label: l.filterSmoothies,
          category: RecipeCategory.smoothie,
          emoji: '🥤'),
      _Filter(
          label: l.filterSalads, category: RecipeCategory.salad, emoji: '🥗'),
      _Filter(
          label: l.filterMains, category: RecipeCategory.mainDish, emoji: '🍲'),
      _Filter(
          label: l.filterSnacks, category: RecipeCategory.snack, emoji: '🌰'),
      _Filter(
          label: l.filterDrinks,
          category: RecipeCategory.beverage,
          emoji: '🍵'),
      _Filter(
          label: l.filterDesserts,
          category: RecipeCategory.dessert,
          emoji: '🍫'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final locale = Localizations.localeOf(context).languageCode;
    return BlocProvider(
      create: (_) => sl<RecipeBloc>()..add(LoadRecipes(locale: locale)),
      child: const _RecipeListView(),
    );
  }
}

class _Filter {
  const _Filter({required this.label, this.category, required this.emoji});
  final String label;
  final RecipeCategory? category;
  final String emoji;
}

class _RecipeListView extends StatefulWidget {
  const _RecipeListView();

  @override
  State<_RecipeListView> createState() => _RecipeListViewState();
}

class _RecipeListViewState extends State<_RecipeListView> {
  final _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(context.l10n.recipeBook),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: TextField(
              controller: _searchController,
              onChanged: (q) =>
                  context.read<RecipeBloc>().add(SearchRecipes(q)),
              decoration: InputDecoration(
                hintText: context.l10n.searchRecipes,
                prefixIcon: Icon(Icons.search, color: context.textLight),
                filled: true,
                fillColor: context.cardBg,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),
          ),
          BlocBuilder<RecipeBloc, RecipeState>(
            builder: (context, state) {
              final selected =
                  state is RecipeLoaded ? state.selectedCategory : null;
              return SizedBox(
                height: 40,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  itemCount: RecipeListPage.filtersFor(context).length,
                  separatorBuilder: (_, __) => const SizedBox(width: 8),
                  itemBuilder: (context, index) {
                    final filter = RecipeListPage.filtersFor(context)[index];
                    final isSelected = filter.category == selected;
                    return GestureDetector(
                      onTap: () => context
                          .read<RecipeBloc>()
                          .add(FilterRecipes(filter.category)),
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
          Expanded(
            child: BlocBuilder<RecipeBloc, RecipeState>(
              builder: (context, state) {
                if (state is RecipeLoading) {
                  return const Center(
                    child:
                        CircularProgressIndicator(color: AppColors.sageGreen),
                  );
                }

                if (state is RecipeLoaded) {
                  return ListView.builder(
                    padding: const EdgeInsets.only(top: 4, bottom: 24),
                    itemCount: state.recipes.length,
                    itemBuilder: (context, index) {
                      final recipe = state.recipes[index];
                      return RecipeCard(
                        recipe: recipe,
                        animationDelay: Duration(milliseconds: 40 * index),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => RecipeDetailPage(recipe: recipe),
                            ),
                          );
                        },
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
