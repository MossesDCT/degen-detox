import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/di.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_strings.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../bloc/purchase_bloc.dart';
import '../widgets/feature_comparison.dart';
import '../../../../core/theme/theme_helper.dart';

/// PRO upgrade page with feature comparison and purchase flow.
class ProUpgradePage extends StatelessWidget {
  const ProUpgradePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<PurchaseBloc>()..add(const CheckProStatus()),
      child: const _ProUpgradeView(),
    );
  }
}

class _ProUpgradeView extends StatelessWidget {
  const _ProUpgradeView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocConsumer<PurchaseBloc, PurchaseState>(
        listener: (context, state) {
          if (state is PurchaseSuccess) {
            // PRO activated — immediately re-check so we show _AlreadyProView
            context.read<PurchaseBloc>().add(const CheckProStatus());
            // Navigate back after a brief celebration delay
            Future.delayed(const Duration(seconds: 2), () {
              if (context.mounted) context.pop();
            });
          } else if (state is PurchaseError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is PurchaseProActive) {
            return const _AlreadyProView();
          }

          return Stack(
            children: [
              CustomScrollView(
                slivers: [
                  // Hero banner
                  SliverToBoxAdapter(
                    child: Container(
                      padding: const EdgeInsets.fromLTRB(24, 60, 24, 32),
                      decoration: const BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [Color(0xFF2D3A2E), Color(0xFF4A6A4A)],
                        ),
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              IconButton(
                                icon: const Icon(Icons.close,
                                    color: Colors.white),
                                onPressed: () => context.pop(),
                              ),
                            ],
                          ),
                          const Text('⭐', style: TextStyle(fontSize: 56))
                              .animate()
                              .scale(
                                  duration: 600.ms, curve: Curves.elasticOut),
                          const SizedBox(height: 16),
                          Text(
                            context.l10n.cortisolZeroPro,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w800,
                            ),
                          ).animate(delay: 200.ms).fadeIn(duration: 400.ms),
                          const SizedBox(height: 8),
                          Text(
                            context.l10n.upgradeSubtitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.8),
                              fontSize: 15,
                            ),
                          ).animate(delay: 300.ms).fadeIn(duration: 400.ms),

                          const SizedBox(height: 24),

                          // PRO feature highlights — App Blocker first
                          ...[
                            '🛡️ ${context.l10n.appBlocker}',
                            '🍽️ ${context.l10n.recipes22}',
                            '🧘 ${context.l10n.meditationLibrary}',
                            '🤖 ${context.l10n.moodInsights}',
                          ].asMap().entries.map((entry) {
                            final isFirst = entry.key == 0;
                            return Padding(
                              padding: const EdgeInsets.only(bottom: 8),
                              child: Row(
                                children: [
                                  const Icon(Icons.check_rounded,
                                      color: Color(0xFFFFD700), size: 18),
                                  const SizedBox(width: 10),
                                  Text(
                                    entry.value,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: isFirst ? 15 : 14,
                                      fontWeight: isFirst
                                          ? FontWeight.w800
                                          : FontWeight.w500,
                                    ),
                                  ),
                                ],
                              )
                                  .animate(
                                      delay: Duration(
                                          milliseconds: 400 + entry.key * 80))
                                  .fadeIn(duration: 350.ms)
                                  .slideX(begin: 0.1, end: 0),
                            );
                          }),
                        ],
                      ),
                    ),
                  ),

                  // Feature comparison
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 24),
                      child: Column(
                        children: [
                          Text(
                            context.l10n.whatYouGet,
                            style: theme.textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(height: 8),
                          const FeatureComparison(),
                        ],
                      ),
                    ).animate(delay: 200.ms).fadeIn(duration: 400.ms),
                  ),

                  // Pricing
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(20),
                            decoration: BoxDecoration(
                              gradient: const LinearGradient(
                                colors: [Color(0xFFFFF3CD), Color(0xFFFFF8DC)],
                              ),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                  color: AppColors.proBadge.withOpacity(0.3)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text(
                                      state is PurchaseFreeUser
                                          ? state.priceString
                                          : '\$6.50',
                                      style: theme.textTheme.displaySmall
                                          ?.copyWith(
                                        fontWeight: FontWeight.w800,
                                        color: AppColors.proBadge,
                                      ),
                                    ),
                                    Text(
                                      context.l10n.oneTimePayment,
                                      style: TextStyle(
                                        color: context.textSecondary,
                                        fontSize: 12,
                                      ),
                                    ),
                                    Text(
                                      context.l10n.noSubscription,
                                      style: TextStyle(
                                        color: context.textSecondary,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Purchase button
                          SizedBox(
                            width: double.infinity,
                            child: state is PurchaseProcessing
                                ? Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 18),
                                    decoration: BoxDecoration(
                                      color: context.dividerColor,
                                      borderRadius: BorderRadius.circular(16),
                                    ),
                                    child: Center(
                                      child: SizedBox(
                                        width: 24,
                                        height: 24,
                                        child: CircularProgressIndicator(
                                          strokeWidth: 2,
                                          color: context.textSecondary,
                                        ),
                                      ),
                                    ),
                                  )
                                : ElevatedButton(
                                    onPressed: () {
                                      context
                                          .read<PurchaseBloc>()
                                          .add(const InitiatePurchase());
                                    },
                                    style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.proBadge,
                                      padding: const EdgeInsets.symmetric(
                                          vertical: 18),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                    ),
                                    child: Text(
                                      context.l10n.unlockProButton(
                                          state is PurchaseFreeUser
                                              ? state.priceString
                                              : '\$6.50'),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                          ),

                          const SizedBox(height: 12),

                          TextButton(
                            onPressed: () {
                              context
                                  .read<PurchaseBloc>()
                                  .add(const RestorePurchases());
                            },
                            child: Text(
                              context.l10n.restorePurchases,
                              style: TextStyle(color: context.textSecondary),
                            ),
                          ),

                          const SizedBox(height: 8),
                          Text(
                            context.l10n.paymentDisclaimer,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 11,
                              color: context.textLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  const SliverToBoxAdapter(child: SizedBox(height: 24)),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}

class _AlreadyProView extends StatefulWidget {
  const _AlreadyProView();

  @override
  State<_AlreadyProView> createState() => _AlreadyProViewState();
}

class _AlreadyProViewState extends State<_AlreadyProView>
    with SingleTickerProviderStateMixin {
  late final AnimationController _spinController;

  @override
  void initState() {
    super.initState();
    _spinController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    )..repeat();
  }

  @override
  void dispose() {
    _spinController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                RotationTransition(
                  turns: _spinController,
                  child: const Text('✨', style: TextStyle(fontSize: 72)),
                ).animate().scale(
                      duration: 600.ms,
                      curve: Curves.elasticOut,
                    ),
                const SizedBox(height: 24),
                Text(
                  'PRO Activated!',
                  textAlign: TextAlign.center,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.w800,
                    color: AppColors.proBadge,
                  ),
                ).animate(delay: 200.ms).fadeIn(duration: 400.ms),
                const SizedBox(height: 8),
                Text(
                  context.l10n.youHavePro,
                  textAlign: TextAlign.center,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: AppColors.proBadge,
                  ),
                ).animate(delay: 300.ms).fadeIn(duration: 400.ms),
                const SizedBox(height: 12),
                Text(
                  context.l10n.proActivatedMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.textSecondary,
                    fontSize: 15,
                    height: 1.4,
                  ),
                ).animate(delay: 400.ms).fadeIn(duration: 400.ms),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.pop();
                      context.push('${AppStrings.routeMore}/app-blocker');
                    },
                    icon: const Text('🛡️', style: TextStyle(fontSize: 18)),
                    label: Text(
                      context.l10n.appBlocker,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.proBadge,
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                  ),
                )
                    .animate(delay: 500.ms)
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.1, end: 0),
                const SizedBox(height: 12),
                TextButton(
                  onPressed: () => context.pop(),
                  child: Text(
                    context.l10n.awesome,
                    style: TextStyle(color: context.textSecondary),
                  ),
                ).animate(delay: 600.ms).fadeIn(duration: 300.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
