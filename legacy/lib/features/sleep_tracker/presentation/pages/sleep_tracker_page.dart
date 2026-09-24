import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:intl/intl.dart';

import '../../../../config/di.dart';
import '../../../../core/constants/app_colors.dart';
import '../bloc/sleep_bloc.dart';
import '../../data/bedtime_reminder_service.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Sleep quality tracker page.
class SleepTrackerPage extends StatelessWidget {
  const SleepTrackerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SleepBloc>()..add(const LoadSleepData()),
      child: const _SleepTrackerView(),
    );
  }
}

class _SleepTrackerView extends StatelessWidget {
  const _SleepTrackerView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(context.l10n.sleepTrackerTitle),
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            icon: const Icon(Icons.add_rounded),
            onPressed: () => _showAddEntrySheet(context),
          ),
        ],
      ),
      body: BlocBuilder<SleepBloc, SleepState>(
        builder: (context, state) {
          if (state is SleepLoading) {
            return const Center(
              child: CircularProgressIndicator(color: AppColors.sageGreen),
            );
          }

          if (state is SleepLoaded) {
            return ListView(
              padding: const EdgeInsets.all(20),
              children: [
                // Summary cards
                Row(
                  children: [
                    Expanded(
                      child: _SummaryCard(
                        emoji: '⭐',
                        label: context.l10n.avgQuality,
                        value: state.averageQuality != null
                            ? '${state.averageQuality!.toStringAsFixed(1)}/5'
                            : '—',
                        color: AppColors.proBadge,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SummaryCard(
                        emoji: '⏰',
                        label: context.l10n.avgDuration,
                        value: state.averageDuration != null
                            ? '${state.averageDuration!.toStringAsFixed(1)}h'
                            : '—',
                        color: AppColors.oceanBlue,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: _SummaryCard(
                        emoji: '📅',
                        label: context.l10n.tracked,
                        value: '${state.entries.length}',
                        color: AppColors.sageGreen,
                      ),
                    ),
                  ],
                ).animate().fadeIn(duration: 400.ms),

                const SizedBox(height: 20),

                // Weekly chart
                if (state.lastWeek.isNotEmpty) ...[
                  Text(
                    context.l10n.last7Days,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  Container(
                    height: 160,
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
                    child: BarChart(
                      BarChartData(
                        maxY: 5,
                        minY: 0,
                        barGroups: state.lastWeek.asMap().entries.map((e) {
                          return BarChartGroupData(
                            x: e.key,
                            barRods: [
                              BarChartRodData(
                                toY: e.value.quality.toDouble(),
                                color: _qualityColor(e.value.quality),
                                width: 24,
                                borderRadius: BorderRadius.circular(6),
                              ),
                            ],
                          );
                        }).toList(),
                        gridData: const FlGridData(show: false),
                        borderData: FlBorderData(show: false),
                        titlesData: FlTitlesData(
                          leftTitles: const AxisTitles(
                            sideTitles: SideTitles(showTitles: false),
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
                                final idx = value.toInt();
                                if (idx < state.lastWeek.length) {
                                  return Text(
                                    DateFormat('E')
                                        .format(state.lastWeek[idx].date),
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
                  const SizedBox(height: 20),
                ],

                // Bedtime reminder
                Container(
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
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          const Text('🌙', style: TextStyle(fontSize: 24)),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              context.l10n.bedtimeReminder,
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.w700,
                              ),
                            ),
                          ),
                          Switch(
                            value: state.bedtimeReminderEnabled,
                            onChanged: (v) {
                              context.read<SleepBloc>().add(
                                    UpdateBedtimeReminder(enabled: v),
                                  );
                            },
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      GestureDetector(
                        onTap: () async {
                          final picked = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay(
                              hour: state.bedtimeHour,
                              minute: state.bedtimeMinute,
                            ),
                          );
                          if (picked != null && context.mounted) {
                            context.read<SleepBloc>().add(
                                  UpdateBedtimeReminder(
                                    enabled: state.bedtimeReminderEnabled,
                                    hour: picked.hour,
                                    minute: picked.minute,
                                  ),
                                );
                          }
                        },
                        child: Text(
                          context.l10n.scheduledAt(
                              '${state.bedtimeHour.toString().padLeft(2, '0')}:${state.bedtimeMinute.toString().padLeft(2, '0')}'),
                          style: theme.textTheme.bodySmall?.copyWith(
                            color: context.textSecondary,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ),
                      // Debug: Test alarm in 1 minute (only visible when reminder is on)
                      if (state.bedtimeReminderEnabled) ...[
                        const SizedBox(height: 12),
                        OutlinedButton.icon(
                          onPressed: () async {
                            await BedtimeReminderService.instance
                                .scheduleTestIn1Minute();
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text(
                                    context.l10n.testAlarmScheduled,
                                  ),
                                  duration: const Duration(seconds: 3),
                                ),
                              );
                            }
                          },
                          icon:
                              const Icon(Icons.notifications_active, size: 18),
                          label: Text(context.l10n.testAlarmIn1Min),
                          style: OutlinedButton.styleFrom(
                            foregroundColor: AppColors.sageGreen,
                            side: const BorderSide(color: AppColors.sageGreen),
                          ),
                        ),
                      ],
                    ],
                  ),
                ).animate(delay: 150.ms).fadeIn(duration: 400.ms),

                const SizedBox(height: 20),

                // Recent entries
                if (state.entries.isNotEmpty) ...[
                  Text(
                    context.l10n.recentEntries,
                    style: theme.textTheme.titleMedium?.copyWith(
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                  const SizedBox(height: 12),
                  ...state.entries.take(7).map((entry) {
                    return Container(
                      margin: const EdgeInsets.only(bottom: 8),
                      padding: const EdgeInsets.all(12),
                      decoration: BoxDecoration(
                        color: context.cardBg,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          Text(
                            '★' * entry.quality,
                            style: const TextStyle(
                                color: AppColors.proBadge, fontSize: 12),
                          ),
                          const SizedBox(width: 12),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  DateFormat('EEE, MMM d').format(entry.date),
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                Text(
                                  '${entry.durationHours}h • ${entry.bedtime} → ${entry.wakeTime}',
                                  style: theme.textTheme.bodySmall?.copyWith(
                                    color: context.textSecondary,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              ],
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }

  Color _qualityColor(int quality) {
    switch (quality) {
      case 5:
        return AppColors.moodGreat;
      case 4:
        return AppColors.moodGood;
      case 3:
        return AppColors.moodOkay;
      case 2:
        return AppColors.moodBad;
      case 1:
        return AppColors.moodTerrible;
      default:
        return AppColors.sageGreen;
    }
  }

  void _showAddEntrySheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<SleepBloc>(),
        child: const _AddSleepEntrySheet(),
      ),
    );
  }
}

class _SummaryCard extends StatelessWidget {
  const _SummaryCard({
    required this.emoji,
    required this.label,
    required this.value,
    required this.color,
  });

  final String emoji;
  final String label;
  final String value;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.circular(14),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(context.shadowOpacity),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 22)),
          const SizedBox(height: 4),
          Text(
            value,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w800,
              color: color,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              fontSize: 10,
              color: context.textSecondary,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _AddSleepEntrySheet extends StatefulWidget {
  const _AddSleepEntrySheet();

  @override
  State<_AddSleepEntrySheet> createState() => _AddSleepEntrySheetState();
}

class _AddSleepEntrySheetState extends State<_AddSleepEntrySheet> {
  int _quality = 3;
  double _duration = 7.0;
  String _bedtime = '22:30';
  String _wakeTime = '06:30';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Container(
              width: 40,
              height: 4,
              decoration: BoxDecoration(
                color: context.dividerColor,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
          ),
          const SizedBox(height: 20),

          Text(
            context.l10n.logSleep,
            style: theme.textTheme.titleLarge
                ?.copyWith(fontWeight: FontWeight.w700),
          ),

          const SizedBox(height: 16),

          // Quality
          Text(context.l10n.sleepQuality, style: theme.textTheme.titleSmall),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(5, (i) {
              final q = i + 1;
              return GestureDetector(
                onTap: () => setState(() => _quality = q),
                child: Text(
                  '★',
                  style: TextStyle(
                    fontSize: 32,
                    color:
                        q <= _quality ? AppColors.proBadge : AppColors.divider,
                  ),
                ),
              );
            }),
          ),

          const SizedBox(height: 16),

          // Duration
          Text('Duration: ${_duration.toStringAsFixed(1)}h',
              style: theme.textTheme.titleSmall),
          Slider(
            value: _duration,
            min: 1,
            max: 12,
            divisions: 22,
            label: '${_duration.toStringAsFixed(1)}h',
            onChanged: (v) => setState(() => _duration = v),
          ),

          const SizedBox(height: 16),

          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.bedtime,
                        style: theme.textTheme.bodySmall),
                    GestureDetector(
                      onTap: () async {
                        final t = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 22, minute: 30),
                        );
                        if (t != null) {
                          setState(() => _bedtime =
                              '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: context.dividerColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(_bedtime),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(context.l10n.wakeTime,
                        style: theme.textTheme.bodySmall),
                    GestureDetector(
                      onTap: () async {
                        final t = await showTimePicker(
                          context: context,
                          initialTime: const TimeOfDay(hour: 6, minute: 30),
                        );
                        if (t != null) {
                          setState(() => _wakeTime =
                              '${t.hour.toString().padLeft(2, '0')}:${t.minute.toString().padLeft(2, '0')}');
                        }
                      },
                      child: Container(
                        padding: const EdgeInsets.all(12),
                        decoration: BoxDecoration(
                          border: Border.all(color: context.dividerColor),
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(_wakeTime),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),

          const SizedBox(height: 24),

          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                context.read<SleepBloc>().add(AddSleepEntry(
                      quality: _quality,
                      durationHours: _duration,
                      bedtime: _bedtime,
                      wakeTime: _wakeTime,
                    ));
                Navigator.pop(context);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.sageGreen,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14)),
              ),
              child: Text(
                context.l10n.save,
                style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.w700),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
