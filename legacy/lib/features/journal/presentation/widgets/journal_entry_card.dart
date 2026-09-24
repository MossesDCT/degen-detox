import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:intl/intl.dart';
import '../../../../core/constants/app_colors.dart';
import '../../domain/entities/journal_entry.dart';
import '../../../../core/theme/theme_helper.dart';

class JournalEntryCard extends StatelessWidget {
  const JournalEntryCard({
    super.key,
    required this.entry,
    this.onDelete,
    this.animationDelay = Duration.zero,
  });

  final JournalEntry entry;
  final VoidCallback? onDelete;
  final Duration animationDelay;

  Color get _moodColor {
    switch (entry.mood) {
      case MoodLevel.great:
        return AppColors.moodGreat;
      case MoodLevel.good:
        return AppColors.moodGood;
      case MoodLevel.okay:
        return AppColors.moodOkay;
      case MoodLevel.bad:
        return AppColors.moodBad;
      case MoodLevel.terrible:
        return AppColors.moodTerrible;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final dateStr = DateFormat('E, MMM d • h:mm a').format(entry.date);

    return Dismissible(
      key: Key(entry.id),
      direction: DismissDirection.endToStart,
      background: Container(
        alignment: Alignment.centerRight,
        padding: const EdgeInsets.only(right: 20),
        color: AppColors.error,
        child: const Icon(Icons.delete_rounded, color: Colors.white),
      ),
      onDismissed: (_) => onDelete?.call(),
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
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
        child: Row(
          children: [
            // Mood color bar
            Container(
              width: 4,
              height: 70,
              decoration: BoxDecoration(
                color: _moodColor,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(16),
                  bottomLeft: Radius.circular(16),
                ),
              ),
            ),

            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                child: Row(
                  children: [
                    Text(
                      entry.mood.emoji,
                      style: const TextStyle(fontSize: 32),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                entry.mood.getLocalizedName(context),
                                style: theme.textTheme.titleSmall?.copyWith(
                                  fontWeight: FontWeight.w700,
                                  color: _moodColor,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(
                                dateStr,
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: context.textLight,
                                  fontSize: 11,
                                ),
                              ),
                            ],
                          ),
                          if (entry.note != null && entry.note!.isNotEmpty) ...[
                            const SizedBox(height: 4),
                            Text(
                              entry.note!,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: context.textSecondary,
                                height: 1.4,
                              ),
                            ),
                          ],
                          if (entry.tags.isNotEmpty) ...[
                            const SizedBox(height: 6),
                            Wrap(
                              spacing: 4,
                              children: entry.tags.map((tag) {
                                return Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 6, vertical: 2),
                                  decoration: BoxDecoration(
                                    color: AppColors.lavender.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(6),
                                  ),
                                  child: Text(
                                    '#$tag',
                                    style: const TextStyle(
                                      fontSize: 10,
                                      color: AppColors.deepLavender,
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    )
        .animate(delay: animationDelay)
        .fadeIn(duration: 350.ms)
        .slideX(begin: 0.1, end: 0);
  }
}
