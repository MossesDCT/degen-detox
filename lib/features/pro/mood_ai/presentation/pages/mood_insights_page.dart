import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';

import '../../../../../config/di.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/localization/app_localizations_helper.dart';
import '../../../../../core/theme/theme_helper.dart';
import '../../../../journal/data/datasources/journal_local_datasource.dart';
import '../bloc/mood_insights_bloc.dart';

/// AI Mood Insights page (PRO).
/// Shows 3-day quick insights + weekly mood trend chart, pattern detection,
/// and personalized tips. Uses real journal data when available, falls back to demo data.
class MoodInsightsPage extends StatelessWidget {
  const MoodInsightsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MoodInsightsBloc(datasource: sl<JournalLocalDatasource>())
        ..add(const LoadMoodInsights()),
      child: const _MoodInsightsView(),
    );
  }
}

class _MoodInsightsView extends StatelessWidget {
  const _MoodInsightsView();

  // Demo data for when user has no entries yet
  static const List<double> _demoMoodData = [3.0, 4.0, 2.5, 3.5, 4.5, 3.0, 4.0];
  static const List<double> _demo3DayData = [3.5, 4.0, 4.5];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = context.l10n;

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(l.moodInsights),
        backgroundColor: Colors.transparent,
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 16, top: 8, bottom: 8),
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              gradient: const LinearGradient(
                  colors: [Color(0xFFD4AF37), Color(0xFFFFD700)]),
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Text(
              'AI PRO',
              style: TextStyle(
                color: Colors.white,
                fontSize: 11,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ],
      ),
      body: BlocBuilder<MoodInsightsBloc, MoodInsightsState>(
        builder: (context, state) {
          // ── Error state ──────────────────────────────────────────────────
          if (state is MoodInsightsError) {
            return Center(
              child: Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('⚠️', style: TextStyle(fontSize: 48)),
                    const SizedBox(height: 16),
                    Text(
                      l.moodInsightsError,
                      textAlign: TextAlign.center,
                      style: theme.textTheme.bodyMedium?.copyWith(
                        color: context.textSecondary,
                      ),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton.icon(
                      onPressed: () {
                        context
                            .read<MoodInsightsBloc>()
                            .add(const RetryMoodInsights());
                      },
                      icon: const Icon(Icons.refresh),
                      label: Text(l.moodInsightsRetry),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.sageGreen,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          // ── Loading state ────────────────────────────────────────────────
          if (state is MoodInsightsLoading || state is MoodInsightsInitial) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.sageGreen),
            );
          }

          // ── Loaded state ─────────────────────────────────────────────────
          List<double> moodData;
          List<double> threeDayData;
          double weeklyAverage;
          double threeDayAverage;
          double trend;
          bool isDemo;
          bool hasThreeDayData;

          if (state is MoodInsightsLoaded && state.hasData) {
            moodData = state.weeklyMoods.map((m) => m > 0 ? m : 3.0).toList();
            threeDayData =
                state.threeDayMoods.map((m) => m > 0 ? m : 3.0).toList();
            weeklyAverage = state.weeklyAverage;
            threeDayAverage = state.threeDayAverage;
            trend = state.trend;
            isDemo = false;
            hasThreeDayData = state.hasThreeDayData;
          } else if (state is MoodInsightsLoaded && !state.hasData) {
            // Partial data: show demo but notify user
            moodData = _demoMoodData;
            threeDayData = _demo3DayData;
            weeklyAverage =
                _demoMoodData.reduce((a, b) => a + b) / _demoMoodData.length;
            threeDayAverage =
                _demo3DayData.reduce((a, b) => a + b) / _demo3DayData.length;
            trend = 0.5;
            isDemo = true;
            hasThreeDayData = false;
          } else {
            moodData = _demoMoodData;
            threeDayData = _demo3DayData;
            weeklyAverage =
                _demoMoodData.reduce((a, b) => a + b) / _demoMoodData.length;
            threeDayAverage =
                _demo3DayData.reduce((a, b) => a + b) / _demo3DayData.length;
            trend = 0.5;
            isDemo = true;
            hasThreeDayData = false;
          }

          final dayLbls = [
            l.dayMon,
            l.dayTue,
            l.dayWed,
            l.dayThu,
            l.dayFri,
            l.daySat,
            l.daySun
          ];

          String stressLabel;
          Color stressColor;
          if (weeklyAverage >= 4.0) {
            stressLabel = l.stressLow;
            stressColor = AppColors.moodGreat;
          } else if (weeklyAverage >= 3.0) {
            stressLabel = l.stressModerate;
            stressColor = AppColors.moodOkay;
          } else {
            stressLabel = l.stressHigh;
            stressColor = AppColors.moodBad;
          }

          return ListView(
            padding: const EdgeInsets.all(20),
            children: [
              // Not enough data notice
              if (isDemo)
                Container(
                  padding: const EdgeInsets.all(12),
                  margin: const EdgeInsets.only(bottom: 16),
                  decoration: BoxDecoration(
                    color: AppColors.lavender.withOpacity(0.3),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.info_outline,
                          size: 16, color: AppColors.textSecondary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          l.moodInsightsNotEnoughData,
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: context.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),

              // ── 3-Day Quick Insights section ──────────────────────────────
              _SectionTitle(title: '⚡ ${l.moodInsights3DayTitle}'),
              const SizedBox(height: 12),

              Container(
                height: 120,
                padding: const EdgeInsets.all(16),
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
                child: LineChart(
                  LineChartData(
                    maxY: 5,
                    minY: 1,
                    lineBarsData: [
                      LineChartBarData(
                        spots: threeDayData.asMap().entries.map((e) {
                          return FlSpot(e.key.toDouble(), e.value);
                        }).toList(),
                        isCurved: true,
                        color: AppColors.skyBlue,
                        barWidth: 3,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 5,
                              color: AppColors.skyBlue,
                              strokeColor: Colors.white,
                              strokeWidth: 2,
                            );
                          },
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          color: AppColors.skyBlue.withOpacity(0.1),
                        ),
                      ),
                    ],
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: context.dividerColor,
                          strokeWidth: 1,
                        );
                      },
                      drawVerticalLine: false,
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (v, m) => Text(
                            '${v.toInt()}',
                            style: TextStyle(
                              fontSize: 10,
                              color: context.textLight,
                            ),
                          ),
                          reservedSize: 20,
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final labels = [
                              '-2d',
                              '-1d',
                              l.dayMon.substring(0, 1) + ''
                            ];
                            final i = value.toInt();
                            // Simple: show 2 days ago, yesterday, today
                            const dayLabels = ['2d ago', 'Yesterday', 'Today'];
                            if (i >= 0 && i < dayLabels.length) {
                              return Text(
                                dayLabels[i],
                                style: TextStyle(
                                  fontSize: 9,
                                  color: context.textSecondary,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ).animate().fadeIn(duration: 400.ms),

              const SizedBox(height: 12),

              // 3-day average card
              Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: context.cardBg,
                  borderRadius: BorderRadius.circular(14),
                ),
                child: Row(
                  children: [
                    const Text('📊', style: TextStyle(fontSize: 20)),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${hasThreeDayData ? l.avgMood : l.aiDemoLabel}',
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: context.textSecondary,
                          ),
                        ),
                        Text(
                          '${threeDayAverage.toStringAsFixed(1)}/5',
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.w800,
                            color: AppColors.skyBlue,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              // ── Weekly Pattern Analysis section ───────────────────────────
              _SectionTitle(title: '📅 ${l.moodInsightsWeeklyTitle}'),
              const SizedBox(height: 12),

              // Stress score cards
              Row(
                children: [
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.cardBg,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(context.shadowOpacity),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Text(
                            l.stressLevel,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            stressLabel,
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: stressColor,
                            ),
                          ),
                          Text(
                            l.thisWeek,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textLight,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.cardBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            l.avgMood,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${weeklyAverage.toStringAsFixed(1)}/5',
                            style: theme.textTheme.headlineSmall?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: AppColors.sageGreen,
                            ),
                          ),
                          Text(
                            l.sevenDayAverage,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textLight,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: context.cardBg,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          Text(
                            l.trend,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textSecondary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${trend >= 0 ? "↗" : "↘"} ${trend >= 0 ? "+" : ""}${trend.toStringAsFixed(1)}',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w800,
                              color: trend >= 0
                                  ? AppColors.moodGreat
                                  : AppColors.moodBad,
                            ),
                          ),
                          Text(
                            l.vsLastWeek,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: context.textLight,
                              fontSize: 10,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ).animate(delay: 50.ms).fadeIn(duration: 400.ms),

              const SizedBox(height: 20),

              // Weekly trend chart
              Text(
                l.weeklyMoodTrend,
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              Container(
                height: 180,
                padding: const EdgeInsets.all(16),
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
                child: LineChart(
                  LineChartData(
                    maxY: 5,
                    minY: 1,
                    lineBarsData: [
                      LineChartBarData(
                        spots: moodData.asMap().entries.map((e) {
                          return FlSpot(e.key.toDouble(), e.value);
                        }).toList(),
                        isCurved: true,
                        color: AppColors.sageGreen,
                        barWidth: 3,
                        dotData: FlDotData(
                          show: true,
                          getDotPainter: (spot, percent, barData, index) {
                            return FlDotCirclePainter(
                              radius: 5,
                              color: AppColors.sageGreen,
                              strokeColor: Colors.white,
                              strokeWidth: 2,
                            );
                          },
                        ),
                        belowBarData: BarAreaData(
                          show: true,
                          color: AppColors.sageGreen.withOpacity(0.1),
                        ),
                      ),
                    ],
                    gridData: FlGridData(
                      show: true,
                      horizontalInterval: 1,
                      getDrawingHorizontalLine: (value) {
                        return FlLine(
                          color: context.dividerColor,
                          strokeWidth: 1,
                        );
                      },
                      drawVerticalLine: false,
                    ),
                    borderData: FlBorderData(show: false),
                    titlesData: FlTitlesData(
                      leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          interval: 1,
                          getTitlesWidget: (v, m) => Text(
                            '${v.toInt()}',
                            style: TextStyle(
                              fontSize: 10,
                              color: context.textLight,
                            ),
                          ),
                          reservedSize: 20,
                        ),
                      ),
                      rightTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      topTitles: const AxisTitles(
                        sideTitles: SideTitles(showTitles: false),
                      ),
                      bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                          showTitles: true,
                          getTitlesWidget: (value, meta) {
                            final i = value.toInt();
                            if (i < dayLbls.length) {
                              return Text(
                                dayLbls[i],
                                style: TextStyle(
                                  fontSize: 10,
                                  color: context.textSecondary,
                                ),
                              );
                            }
                            return const SizedBox.shrink();
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ).animate(delay: 100.ms).fadeIn(duration: 400.ms),

              const SizedBox(height: 24),

              // AI Patterns
              Text(
                '🤖 ${l.aiDetectedPatterns}',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(height: 12),

              _PatternCard(
                emoji: '📉',
                observation: l.moodPattern1obs,
                tip: l.moodPattern1tip,
                severity: PatternSeverity.moderate,
              )
                  .animate(delay: 200.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),

              _PatternCard(
                emoji: '📈',
                observation: l.moodPattern2obs,
                tip: l.moodPattern2tip,
                severity: PatternSeverity.positive,
              )
                  .animate(delay: 300.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),

              _PatternCard(
                emoji: '😴',
                observation: l.moodPattern3obs,
                tip: l.moodPattern3tip,
                severity: PatternSeverity.moderate,
              )
                  .animate(delay: 400.ms)
                  .fadeIn(duration: 400.ms)
                  .slideY(begin: 0.1, end: 0),

              const SizedBox(height: 16),

              // Weekly summary tip
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text('💡', style: TextStyle(fontSize: 20)),
                        const SizedBox(width: 8),
                        Text(
                          l.weeklyPersonalizedTip,
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 15,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      l.weeklyTipText,
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontSize: 13,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),
              ).animate(delay: 500.ms).fadeIn(duration: 400.ms),

              const SizedBox(height: 16),

              // Retry button at the bottom
              Center(
                child: TextButton.icon(
                  onPressed: () {
                    context
                        .read<MoodInsightsBloc>()
                        .add(const RetryMoodInsights());
                  },
                  icon: const Icon(Icons.refresh, size: 16),
                  label: Text(l.moodInsightsRetry),
                  style: TextButton.styleFrom(
                    foregroundColor: context.textSecondary,
                  ),
                ),
              ),

              const SizedBox(height: 16),
            ],
          );
        },
      ),
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.titleMedium?.copyWith(
            fontWeight: FontWeight.w700,
          ),
    );
  }
}

enum PatternSeverity { positive, moderate, concern }

class _PatternCard extends StatelessWidget {
  const _PatternCard({
    required this.emoji,
    required this.observation,
    required this.tip,
    required this.severity,
  });

  final String emoji;
  final String observation;
  final String tip;
  final PatternSeverity severity;

  Color get _color {
    switch (severity) {
      case PatternSeverity.positive:
        return AppColors.moodGreat;
      case PatternSeverity.moderate:
        return AppColors.moodOkay;
      case PatternSeverity.concern:
        return AppColors.moodBad;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: _color.withOpacity(0.3)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(emoji, style: const TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  observation,
                  style: theme.textTheme.titleSmall?.copyWith(
                    fontWeight: FontWeight.w700,
                    color: context.textPrimary,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: _color.withOpacity(0.08),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.lightbulb_outline, size: 14, color: _color),
                const SizedBox(width: 6),
                Expanded(
                  child: Text(
                    tip,
                    style: theme.textTheme.bodySmall?.copyWith(
                      color: context.textSecondary,
                      height: 1.5,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
