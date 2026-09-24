import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../domain/entities/journal_entry.dart';
import '../../../../core/theme/theme_helper.dart';

/// Calendar widget with colored dots showing daily mood.
class MoodCalendar extends StatelessWidget {
  const MoodCalendar({
    super.key,
    required this.year,
    required this.month,
    required this.moodSummary,
    this.onPreviousMonth,
    this.onNextMonth,
  });

  final int year;
  final int month;
  final Map<String, int> moodSummary; // "YYYY-MM-DD" -> mood value
  final VoidCallback? onPreviousMonth;
  final VoidCallback? onNextMonth;

  Color _moodColor(int value) {
    switch (value) {
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
        return Colors.transparent;
    }
  }

  String _dayKey(int day) =>
      '$year-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final firstDay = DateTime(year, month, 1);
    final daysInMonth = DateTime(year, month + 1, 0).day;
    final startOffset = firstDay.weekday % 7; // 0=Sunday, 1=Monday...

    final monthName = DateFormat('MMMM yyyy').format(firstDay);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
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
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // Month navigation
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  onPressed: onPreviousMonth,
                  icon: const Icon(Icons.chevron_left),
                  color: context.textSecondary,
                ),
                Text(
                  monthName,
                  style: theme.textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.w700,
                  ),
                ),
                IconButton(
                  onPressed: onNextMonth,
                  icon: const Icon(Icons.chevron_right),
                  color: context.textSecondary,
                ),
              ],
            ),

            const SizedBox(height: 8),

            // Day headers
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const ['S', 'M', 'T', 'W', 'T', 'F', 'S']
                  .map((d) => SizedBox(
                        width: 36,
                        child: Text(
                          d,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w700,
                            color: context.textLight,
                          ),
                        ),
                      ))
                  .toList(),
            ),

            const SizedBox(height: 4),

            // Calendar grid
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 7,
                childAspectRatio: 1,
              ),
              itemCount: startOffset + daysInMonth,
              itemBuilder: (context, index) {
                if (index < startOffset) {
                  return const SizedBox.shrink();
                }
                final day = index - startOffset + 1;
                final key = _dayKey(day);
                final moodValue = moodSummary[key];
                final isToday = DateTime.now().year == year &&
                    DateTime.now().month == month &&
                    DateTime.now().day == day;

                return Container(
                  margin: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: moodValue != null
                        ? _moodColor(moodValue).withOpacity(0.8)
                        : Colors.transparent,
                    border: isToday
                        ? Border.all(
                            color: AppColors.sageGreen,
                            width: 2,
                          )
                        : null,
                  ),
                  child: Center(
                    child: Text(
                      '$day',
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: isToday ? FontWeight.w700 : FontWeight.w400,
                        color: moodValue != null
                            ? (moodValue >= 3
                                ? AppColors.textPrimary
                                : Colors.white)
                            : AppColors.textSecondary,
                      ),
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 12),

            // Legend
            Wrap(
              spacing: 12,
              runSpacing: 6,
              alignment: WrapAlignment.center,
              children: [
                for (final mood in MoodLevel.values)
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 10,
                        height: 10,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: _moodColor(mood.value),
                        ),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        mood.getLocalizedName(context),
                        style: TextStyle(
                          fontSize: 10,
                          color: context.textSecondary,
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
