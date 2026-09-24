import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/di.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../bloc/breathing_bloc.dart';
import '../widgets/technique_card.dart';
import '../../../../core/theme/theme_helper.dart';

/// Page showing available breathing techniques.
class BreathingPage extends StatelessWidget {
  const BreathingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<BreathingBloc>(),
      child: const _BreathingView(),
    );
  }
}

class _BreathingView extends StatefulWidget {
  const _BreathingView();

  @override
  State<_BreathingView> createState() => _BreathingViewState();
}

class _BreathingViewState extends State<_BreathingView> {
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    // Load techniques with the current locale every time locale changes
    context.read<BreathingBloc>().add(
          LoadBreathingTechniques(l10n: AppLocalizations.of(context)),
        );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: context.bg,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      context.l10n.breatheTitle,
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
                      context.l10n.breatheSubtitle,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: context.textSecondary,
                      ),
                    ).animate(delay: 100.ms).fadeIn(duration: 400.ms),
                  ],
                ),
              ),
            ),

            // Info banner
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.fromLTRB(20, 0, 20, 24),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: AppColors.calmGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Row(
                  children: [
                    const Text('🧪', style: TextStyle(fontSize: 32)),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.scienceBackedTechniques,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          Text(
                            context.l10n.vagusNerveInfo,
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
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),
            ),

            // Techniques list
            BlocBuilder<BreathingBloc, BreathingState>(
              builder: (context, state) {
                if (state is BreathingLoading) {
                  return const SliverFillRemaining(
                    child: Center(
                      child:
                          CircularProgressIndicator(color: AppColors.sageGreen),
                    ),
                  );
                }

                if (state is BreathingTechniquesLoaded) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final technique = state.techniques[index];
                        return TechniqueCard(
                          technique: technique,
                          animationDelay: Duration(milliseconds: 100 * index),
                          onTap: () {
                            context.push(
                              AppStrings.routeBreathingSession,
                              extra: technique,
                            );
                          },
                        );
                      },
                      childCount: state.techniques.length,
                    ),
                  );
                }

                if (state is BreathingError) {
                  return SliverFillRemaining(
                    child: Center(
                      child: Text('Error: ${state.message}'),
                    ),
                  );
                }

                return const SliverFillRemaining(child: SizedBox.shrink());
              },
            ),

            const SliverToBoxAdapter(child: SizedBox(height: 24)),
          ],
        ),
      ),
    );
  }
}
