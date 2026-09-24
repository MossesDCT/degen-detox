import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../domain/entities/soundscape.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import 'audio_visualizer.dart';
import '../../../../core/theme/theme_helper.dart';

/// Card for a single soundscape with gradient background.
/// Animates when actively playing.
class SoundscapeCard extends StatelessWidget {
  const SoundscapeCard({
    super.key,
    required this.soundscape,
    required this.isPlaying,
    required this.isSelected,
    required this.onTap,
    this.animationDelay = Duration.zero,
  });

  final Soundscape soundscape;
  final bool isPlaying;
  final bool isSelected;
  final VoidCallback onTap;
  final Duration animationDelay;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          gradient: soundscape.gradient,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color:
                  soundscape.primaryColor.withOpacity(isSelected ? 0.4 : 0.15),
              blurRadius: isSelected ? 20 : 8,
              offset: const Offset(0, 4),
              spreadRadius: isSelected ? 2 : 0,
            ),
          ],
          border: isSelected
              ? Border.all(color: Colors.white.withOpacity(0.5), width: 2)
              : null,
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    soundscape.emoji,
                    style: const TextStyle(fontSize: 32),
                  ),
                  if (isSelected)
                    Container(
                      width: 32,
                      height: 32,
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.25),
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        isPlaying
                            ? Icons.pause_rounded
                            : Icons.play_arrow_rounded,
                        color: Colors.white,
                        size: 20,
                      ),
                    ),
                ],
              ),
              const Spacer(),
              Text(
                soundscape.name,
                style: theme.textTheme.titleSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
              if (isPlaying) ...[
                const SizedBox(height: 6),
                const AudioVisualizer(color: Colors.white),
              ] else ...[
                const SizedBox(height: 4),
                Text(
                  isSelected ? context.l10n.paused : context.l10n.tapToPlay,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.7),
                    fontSize: 11,
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    )
        .animate(delay: animationDelay)
        .fadeIn(duration: 400.ms)
        .scale(begin: const Offset(0.9, 0.9), end: const Offset(1, 1));
  }
}
