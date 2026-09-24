import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Mood selector with 5 emoji faces that stores daily selection.
class MoodCheckinWidget extends StatefulWidget {
  const MoodCheckinWidget({super.key});

  @override
  State<MoodCheckinWidget> createState() => _MoodCheckinWidgetState();
}

class _MoodCheckinWidgetState extends State<MoodCheckinWidget> {
  int? _selectedMood;
  bool _alreadyCheckedIn = false;

  static const _kMoodKey = 'home_mood_today';
  static const _kMoodDateKey = 'home_mood_date';

  static const List<_MoodOption> _moods = [
    _MoodOption(emoji: '😰', value: 1, color: AppColors.moodTerrible),
    _MoodOption(emoji: '😔', value: 2, color: AppColors.moodBad),
    _MoodOption(emoji: '😐', value: 3, color: AppColors.moodOkay),
    _MoodOption(emoji: '🙂', value: 4, color: AppColors.moodGood),
    _MoodOption(emoji: '😊', value: 5, color: AppColors.moodGreat),
  ];

  @override
  void initState() {
    super.initState();
    _loadTodaysMood();
  }

  Future<void> _loadTodaysMood() async {
    final prefs = await SharedPreferences.getInstance();
    final savedDate = prefs.getString(_kMoodDateKey);
    final today = DateTime.now().toIso8601String().substring(0, 10);

    if (savedDate == today) {
      setState(() {
        _selectedMood = prefs.getInt(_kMoodKey);
        _alreadyCheckedIn = _selectedMood != null;
      });
    }
  }

  Future<void> _selectMood(int value) async {
    final prefs = await SharedPreferences.getInstance();
    final today = DateTime.now().toIso8601String().substring(0, 10);
    await prefs.setInt(_kMoodKey, value);
    await prefs.setString(_kMoodDateKey, today);

    setState(() {
      _selectedMood = value;
      _alreadyCheckedIn = true;
    });
  }

  String _localizedMoodLabel(BuildContext context, int value) {
    switch (value) {
      case 1:
        return context.l10n.moodTerrible;
      case 2:
        return context.l10n.moodBad;
      case 3:
        return context.l10n.moodOkay;
      case 4:
        return context.l10n.moodGood;
      case 5:
        return context.l10n.moodGreat;
      default:
        return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
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
              const Text('💭', style: TextStyle(fontSize: 20)),
              const SizedBox(width: 8),
              Text(
                _alreadyCheckedIn
                    ? context.l10n.todaysMoodRecorded
                    : context.l10n.howAreYouFeeling,
                style: theme.textTheme.titleSmall?.copyWith(
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _moods.map((mood) {
              final isSelected = _selectedMood == mood.value;
              return GestureDetector(
                onTap: () => _selectMood(mood.value),
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 200),
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isSelected
                        ? mood.color.withOpacity(0.15)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(12),
                    border: isSelected
                        ? Border.all(color: mood.color, width: 2)
                        : null,
                  ),
                  child: Column(
                    children: [
                      Text(
                        mood.emoji,
                        style: TextStyle(fontSize: isSelected ? 30 : 24),
                      ),
                      const SizedBox(height: 3),
                      Text(
                        _localizedMoodLabel(context, mood.value),
                        style: TextStyle(
                          fontSize: 9,
                          color: isSelected ? mood.color : AppColors.textLight,
                          fontWeight:
                              isSelected ? FontWeight.w700 : FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    )
        .animate(delay: 300.ms)
        .fadeIn(duration: 400.ms)
        .slideY(begin: 0.1, end: 0);
  }
}

class _MoodOption {
  const _MoodOption({
    required this.emoji,
    required this.value,
    required this.color,
  });

  final String emoji;
  final int value;
  final Color color;
}
