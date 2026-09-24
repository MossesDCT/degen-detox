import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/di.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../domain/entities/education_snippet.dart';
import '../bloc/education_bloc.dart';
import '../widgets/snippet_card.dart';
import '../../../../core/theme/theme_helper.dart';

/// Education module page displaying cortisol-related learning content.
class EducationPage extends StatelessWidget {
  const EducationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<EducationBloc>(),
      child: const _EducationView(),
    );
  }
}

class _EducationView extends StatefulWidget {
  const _EducationView();

  @override
  State<_EducationView> createState() => _EducationViewState();
}

class _EducationViewState extends State<_EducationView> {
  final _searchController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load snippets with the current locale every time locale changes
    context.read<EducationBloc>().add(
          LoadEducationSnippets(l10n: AppLocalizations.of(context)),
        );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  List<_CategoryFilter> _buildFilters(BuildContext context) {
    final l = context.l10n;
    return [
      _CategoryFilter(label: l.filterAll, category: null, emoji: '📚'),
      _CategoryFilter(
          label: l.filterBasics, category: SnippetCategory.basics, emoji: '🧬'),
      _CategoryFilter(
          label: l.filterScience,
          category: SnippetCategory.science,
          emoji: '🔬'),
      _CategoryFilter(
          label: l.filterImpact, category: SnippetCategory.impact, emoji: '💊'),
      _CategoryFilter(
          label: l.filterReduce,
          category: SnippetCategory.reduction,
          emoji: '🌬️'),
      _CategoryFilter(
          label: l.filterLifestyle,
          category: SnippetCategory.lifestyle,
          emoji: '🌿'),
      _CategoryFilter(
          label: l.filterNutrition,
          category: SnippetCategory.nutrition,
          emoji: '🍎'),
      _CategoryFilter(
          label: l.filterSleep, category: SnippetCategory.sleep, emoji: '😴'),
      _CategoryFilter(
          label: l.filterMind,
          category: SnippetCategory.mindfulness,
          emoji: '🧘'),
    ];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final filters = _buildFilters(context);

    return Scaffold(
      backgroundColor: context.bg,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ── Header ───────────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.learnTitle,
                    style: theme.textTheme.headlineMedium?.copyWith(
                      fontWeight: FontWeight.w800,
                      color: context.textPrimary,
                    ),
                  )
                      .animate()
                      .fadeIn(duration: 400.ms)
                      .slideX(begin: -0.1, end: 0),
                  const SizedBox(height: 4),
                  Text(
                    context.l10n.learnSubtitle,
                    style: theme.textTheme.bodyMedium?.copyWith(
                      color: context.textSecondary,
                    ),
                  ).animate(delay: 100.ms).fadeIn(duration: 400.ms),
                ],
              ),
            ),

            const SizedBox(height: 16),

            // ── Search Bar ───────────────────────────────────────────────
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _searchController,
                onChanged: (query) {
                  context.read<EducationBloc>().add(SearchSnippets(query));
                },
                decoration: InputDecoration(
                  hintText: context.l10n.searchTopics,
                  prefixIcon: Icon(Icons.search, color: context.textLight),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear, color: context.textLight),
                          onPressed: () {
                            _searchController.clear();
                            context
                                .read<EducationBloc>()
                                .add(const SearchSnippets(''));
                          },
                        )
                      : null,
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
            ).animate(delay: 150.ms).fadeIn(duration: 400.ms),

            const SizedBox(height: 12),

            // ── Category Filters ─────────────────────────────────────────
            BlocBuilder<EducationBloc, EducationState>(
              builder: (context, state) {
                final selected =
                    state is EducationLoaded ? state.selectedCategory : null;
                return SizedBox(
                  height: 40,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    itemCount: filters.length,
                    separatorBuilder: (_, __) => const SizedBox(width: 8),
                    itemBuilder: (context, index) {
                      final filter = filters[index];
                      final isSelected = filter.category == selected;
                      return GestureDetector(
                        onTap: () {
                          context
                              .read<EducationBloc>()
                              .add(FilterByCategory(filter.category));
                        },
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 200),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 14, vertical: 8),
                          decoration: BoxDecoration(
                            color: isSelected
                                ? AppColors.sageGreen
                                : context.cardBg,
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
                                  style: const TextStyle(fontSize: 14)),
                              const SizedBox(width: 4),
                              Text(
                                filter.label,
                                style: TextStyle(
                                  fontSize: 13,
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
            ).animate(delay: 200.ms).fadeIn(duration: 400.ms),

            const SizedBox(height: 8),

            // ── Snippets List ─────────────────────────────────────────────
            Expanded(
              child: BlocBuilder<EducationBloc, EducationState>(
                builder: (context, state) {
                  if (state is EducationLoading) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: AppColors.sageGreen,
                      ),
                    );
                  }

                  if (state is EducationError) {
                    return Center(
                      child: Text(
                        'Error: ${state.message}',
                        style: TextStyle(color: AppColors.error),
                      ),
                    );
                  }

                  if (state is EducationLoaded) {
                    if (state.snippets.isEmpty) {
                      return Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('🔍', style: TextStyle(fontSize: 48)),
                            const SizedBox(height: 16),
                            Text(
                              context.l10n.noResultsFound,
                              style: theme.textTheme.titleMedium?.copyWith(
                                color: context.textSecondary,
                              ),
                            ),
                          ],
                        ),
                      );
                    }

                    return ListView.builder(
                      padding: const EdgeInsets.only(top: 8, bottom: 24),
                      itemCount: state.snippets.length + 1,
                      itemBuilder: (context, index) {
                        if (index == 0) {
                          // Nutrition quick link
                          return _NutritionBanner(
                            onTap: () =>
                                context.push(AppStrings.routeNutrition),
                          );
                        }
                        final snippet = state.snippets[index - 1];
                        return SnippetCard(
                          snippet: snippet,
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
      ),
    );
  }
}

class _CategoryFilter {
  const _CategoryFilter({
    required this.label,
    required this.category,
    required this.emoji,
  });

  final String label;
  final SnippetCategory? category;
  final String emoji;
}

class _NutritionBanner extends StatelessWidget {
  const _NutritionBanner({required this.onTap});

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.fromLTRB(20, 8, 20, 8),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          gradient: AppColors.primaryGradient,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          children: [
            const Text('🥗', style: TextStyle(fontSize: 32)),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    context.l10n.nutritionBannerTitle,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  Text(
                    context.l10n.nutritionBannerSub,
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.85),
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, color: Colors.white, size: 16),
          ],
        ),
      ),
    ).animate().fadeIn(duration: 400.ms).slideY(begin: 0.1, end: 0);
  }
}
