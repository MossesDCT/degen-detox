import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';

import '../../../../config/di.dart';
import '../../../../core/constants/app_colors.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../bloc/soundscape_bloc.dart';
import '../widgets/soundscape_card.dart';
import '../widgets/sleep_timer_dialog.dart';
import '../../../../core/theme/theme_helper.dart';

/// Soundscapes page with grid of audio environments.
class SoundscapePage extends StatelessWidget {
  const SoundscapePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => sl<SoundscapeBloc>()..add(const LoadSoundscapes()),
      child: const _SoundscapeView(),
    );
  }
}

class _SoundscapeView extends StatelessWidget {
  const _SoundscapeView();

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return BlocListener<SoundscapeBloc, SoundscapeState>(
      listener: (context, state) {
        if (state is SoundscapePlaybackError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Error playing ${state.soundscapeName}: ${state.errorMessage}',
                style: const TextStyle(fontSize: 12),
              ),
              backgroundColor: Colors.red,
              duration: const Duration(seconds: 8),
            ),
          );
        }
      },
      child: Scaffold(
        backgroundColor: context.bg,
        body: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.soundsTitle,
                            style: theme.textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.w800,
                              color: context.textPrimary,
                            ),
                          ).animate().fadeIn(duration: 400.ms),
                          Text(
                            context.l10n.soundsSubtitle,
                            style: theme.textTheme.bodyMedium?.copyWith(
                              color: context.textSecondary,
                            ),
                          ).animate(delay: 100.ms).fadeIn(duration: 400.ms),
                        ],
                      ),
                    ),

                    // Sleep timer button
                    BlocBuilder<SoundscapeBloc, SoundscapeState>(
                      builder: (context, state) {
                        final hasTimer = state is SoundscapeLoaded &&
                            state.sleepTimerMinutes != null;
                        return IconButton(
                          onPressed: () => SleepTimerDialog.show(context),
                          icon: Icon(
                            Icons.bedtime_outlined,
                            color: hasTimer
                                ? AppColors.sageGreen
                                : AppColors.textSecondary,
                          ),
                          tooltip: context.l10n.sleepTimer,
                        );
                      },
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 8),

              // Active playback bar
              BlocBuilder<SoundscapeBloc, SoundscapeState>(
                builder: (context, state) {
                  if (state is SoundscapeLoaded &&
                      state.activeSoundscape != null) {
                    return _NowPlayingBar(state: state);
                  }
                  return const SizedBox.shrink();
                },
              ),

              const SizedBox(height: 8),

              // Grid
              Expanded(
                child: BlocBuilder<SoundscapeBloc, SoundscapeState>(
                  builder: (context, state) {
                    if (state is SoundscapeLoading) {
                      return const Center(
                        child: CircularProgressIndicator(
                            color: AppColors.sageGreen),
                      );
                    }

                    if (state is SoundscapeLoaded) {
                      return GridView.builder(
                        padding: const EdgeInsets.fromLTRB(16, 8, 16, 24),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 12,
                          mainAxisSpacing: 12,
                          childAspectRatio: 1.0,
                        ),
                        itemCount: state.soundscapes.length,
                        itemBuilder: (context, index) {
                          final soundscape = state.soundscapes[index];
                          final isSelected =
                              state.activeSoundscape?.id == soundscape.id;
                          final isPlaying = isSelected && state.isPlaying;

                          return SoundscapeCard(
                            soundscape: soundscape,
                            isPlaying: isPlaying,
                            isSelected: isSelected,
                            animationDelay: Duration(milliseconds: 80 * index),
                            onTap: () {
                              if (isPlaying) {
                                context
                                    .read<SoundscapeBloc>()
                                    .add(const PauseSoundscape());
                              } else if (isSelected) {
                                context
                                    .read<SoundscapeBloc>()
                                    .add(const ResumeSoundscape());
                              } else {
                                context
                                    .read<SoundscapeBloc>()
                                    .add(PlaySoundscape(soundscape));
                              }
                            },
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
      ),
    );
  }
}

/// Mini now-playing bar at top of soundscape page.
class _NowPlayingBar extends StatelessWidget {
  const _NowPlayingBar({required this.state});

  final SoundscapeLoaded state;

  @override
  Widget build(BuildContext context) {
    final sound = state.activeSoundscape!;

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      decoration: BoxDecoration(
        gradient: sound.gradient,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: sound.primaryColor.withOpacity(0.25),
            blurRadius: 8,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        children: [
          Text(sound.emoji, style: const TextStyle(fontSize: 20)),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.l10n.nowPlaying(sound.name),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 13,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                if (state.sleepTimerMinutes != null)
                  Text(
                    context.l10n.sleepTimerSet(state.sleepTimerMinutes!),
                    style: TextStyle(
                      color: Colors.white.withOpacity(0.75),
                      fontSize: 11,
                    ),
                  ),
              ],
            ),
          ),

          // Volume slider
          SizedBox(
            width: 80,
            child: SliderTheme(
              data: SliderThemeData(
                trackHeight: 2,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                overlayShape: const RoundSliderOverlayShape(overlayRadius: 12),
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white.withOpacity(0.3),
                thumbColor: Colors.white,
                overlayColor: Colors.white.withOpacity(0.2),
              ),
              child: Slider(
                value: state.volume,
                onChanged: (v) =>
                    context.read<SoundscapeBloc>().add(SetVolume(v)),
              ),
            ),
          ),

          // Play/pause button
          GestureDetector(
            onTap: () {
              if (state.isPlaying) {
                context.read<SoundscapeBloc>().add(PauseSoundscape());
              } else {
                context.read<SoundscapeBloc>().add(ResumeSoundscape());
              }
            },
            child: Container(
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(
                state.isPlaying
                    ? Icons.pause_rounded
                    : Icons.play_arrow_rounded,
                color: Colors.white,
                size: 22,
              ),
            ),
          ),

          const SizedBox(width: 4),

          // Stop button
          GestureDetector(
            onTap: () => context.read<SoundscapeBloc>().add(StopSoundscape()),
            child: Icon(Icons.stop_rounded,
                color: Colors.white.withOpacity(0.7), size: 22),
          ),
        ],
      ),
    ).animate().fadeIn(duration: 300.ms).slideY(begin: -0.3, end: 0);
  }
}
