import 'package:flutter/material.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Side-by-side feature comparison widget: Free vs PRO.
class FeatureComparison extends StatelessWidget {
  const FeatureComparison({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = context.l10n;

    final features = <_FeatureRow>[
      // App Blocker is FIRST and highlighted (PRO-only)
      _FeatureRow(l.compAppBlocker, false, true, highlight: true),
      _FeatureRow(l.compEducation, true, true),
      _FeatureRow(l.compBreathing, true, true),
      _FeatureRow(l.compNutrition, true, true),
      _FeatureRow(l.compJournal, true, true),
      _FeatureRow(l.compSleep, true, true),
      _FeatureRow(l.compMeditation, false, true),
      _FeatureRow(l.compRecipes, false, true),
      _FeatureRow(l.compAiInsights, false, true),
      _FeatureRow(l.compWeeklyAnalysis, false, true),
    ];

    return Column(
      children: [
        // Header row
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          child: Row(
            children: [
              const Expanded(flex: 3, child: SizedBox.shrink()),
              Expanded(
                child: Center(
                  child: Text(
                    l.free,
                    style: theme.textTheme.labelMedium?.copyWith(
                      color: context.textSecondary,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Center(
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Color(0xFFD4AF37), Color(0xFFFFD700)],
                      ),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Text(
                      l.proTitle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                        fontSize: 13,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),

        // Feature rows
        ...features.map((f) => _FeatureRowWidget(feature: f)),
      ],
    );
  }
}

class _FeatureRow {
  const _FeatureRow(this.name, this.inFree, this.inPro,
      {this.highlight = false});

  final String name;
  final bool inFree;
  final bool inPro;
  final bool highlight;
}

class _FeatureRowWidget extends StatelessWidget {
  const _FeatureRowWidget({required this.feature});

  final _FeatureRow feature;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isHighlighted = feature.highlight;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 4),
      decoration: isHighlighted
          ? BoxDecoration(
              color: const Color(0xFFFFF8E1),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: const Color(0xFFFFD54F), width: 1.5),
            )
          : null,
      padding: isHighlighted
          ? const EdgeInsets.symmetric(horizontal: 0, vertical: 2)
          : const EdgeInsets.symmetric(vertical: 2),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
        child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Padding(
                padding: EdgeInsets.only(left: isHighlighted ? 10 : 0),
                child: Text(
                  isHighlighted ? '🛡️ ${feature.name}' : feature.name,
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: context.textPrimary,
                    fontWeight:
                        isHighlighted ? FontWeight.w800 : FontWeight.w500,
                    fontSize: isHighlighted ? 13 : null,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Center(
                child: feature.inFree
                    ? const Icon(Icons.check_circle_rounded,
                        color: AppColors.sageGreen, size: 20)
                    : Icon(Icons.remove_rounded,
                        color: context.textLight, size: 20),
              ),
            ),
            Expanded(
              child: Center(
                child: feature.inPro
                    ? Icon(
                        Icons.check_circle_rounded,
                        color: isHighlighted
                            ? const Color(0xFFFFAB00)
                            : AppColors.proBadge,
                        size: isHighlighted ? 22 : 20,
                      )
                    : Icon(Icons.remove_rounded,
                        color: context.textLight, size: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
