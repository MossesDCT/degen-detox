import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../bloc/soundscape_bloc.dart';
import '../../../../core/theme/theme_helper.dart';

/// Bottom sheet dialog to set a sleep timer.
class SleepTimerDialog extends StatelessWidget {
  const SleepTimerDialog({super.key});

  static const List<_TimerOption> _options = [
    _TimerOption(minutes: 15, label: '15 min'),
    _TimerOption(minutes: 30, label: '30 min'),
    _TimerOption(minutes: 45, label: '45 min'),
    _TimerOption(minutes: 60, label: '1 hour'),
    _TimerOption(minutes: 90, label: '90 min'),
    _TimerOption(minutes: 120, label: '2 hours'),
  ];

  static Future<void> show(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (_) => BlocProvider.value(
        value: context.read<SoundscapeBloc>(),
        child: const SleepTimerDialog(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Container(
      decoration: BoxDecoration(
        color: context.cardBg,
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      padding: const EdgeInsets.fromLTRB(24, 16, 24, 32),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Handle bar
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
            context.l10n.sleepTimer,
            style: theme.textTheme.titleLarge?.copyWith(
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 6),
          Text(
            context.l10n.audioWillStop,
            style: theme.textTheme.bodySmall?.copyWith(
              color: context.textSecondary,
            ),
          ),

          const SizedBox(height: 20),

          Wrap(
            spacing: 12,
            runSpacing: 12,
            children: [
              ..._options.map((option) {
                return _TimerButton(
                  option: option,
                  onTap: () {
                    context
                        .read<SoundscapeBloc>()
                        .add(SetSleepTimer(option.minutes));
                    Navigator.pop(context);
                  },
                );
              }),

              // Cancel timer option
              BlocBuilder<SoundscapeBloc, SoundscapeState>(
                builder: (context, state) {
                  if (state is SoundscapeLoaded &&
                      state.sleepTimerMinutes != null) {
                    return GestureDetector(
                      onTap: () {
                        context
                            .read<SoundscapeBloc>()
                            .add(const SetSleepTimer(null));
                        Navigator.pop(context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 12),
                        decoration: BoxDecoration(
                          color: AppColors.error.withOpacity(0.08),
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(
                              color: AppColors.error.withOpacity(0.3)),
                        ),
                        child: Text(
                          context.l10n.cancelTimer,
                          style: const TextStyle(
                            color: AppColors.error,
                            fontWeight: FontWeight.w600,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    );
                  }
                  return const SizedBox.shrink();
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _TimerOption {
  const _TimerOption({required this.minutes, required this.label});

  final int minutes;
  final String label;
}

class _TimerButton extends StatelessWidget {
  const _TimerButton({required this.option, required this.onTap});

  final _TimerOption option;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.lightSage.withOpacity(0.5),
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: AppColors.sageGreen.withOpacity(0.3)),
        ),
        child: Text(
          option.label,
          style: const TextStyle(
            color: AppColors.deepSage,
            fontWeight: FontWeight.w600,
            fontSize: 14,
          ),
        ),
      ),
    );
  }
}
