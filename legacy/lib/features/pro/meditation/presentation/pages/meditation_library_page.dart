import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/localization/app_localizations_helper.dart';
import '../../../../../core/theme/theme_helper.dart';
import '../../../../../main.dart';
import '../bloc/meditation_bloc.dart';

/// Guided meditation library page (PRO feature).
/// Plays actual meditation audio files from assets/audio/.
class MeditationLibraryPage extends StatelessWidget {
  const MeditationLibraryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => MeditationBloc(),
      child: const _MeditationLibraryView(),
    );
  }
}

class _MeditationLibraryView extends StatelessWidget {
  const _MeditationLibraryView();

  /// Returns the audio asset path for a meditation, localized by the
  /// user-selected locale from AppSettings (not the system locale).
  /// Falls back to English (root) if the locale folder doesn't exist.
  String _audioPath(BuildContext context, String filename) {
    final locale = AppSettings.of(context).locale.languageCode;
    const supported = {'lt', 'es', 'fr', 'de', 'ko'};
    if (supported.contains(locale)) {
      return 'assets/audio/$locale/$filename';
    }
    return 'assets/audio/$filename';
  }

  @override
  Widget build(BuildContext context) {
    final l = context.l10n;

    // Map meditation entries to actual audio files (localized)
    final meditations = <_MeditationEntry>[
      _MeditationEntry(
        emoji: '☀️',
        title: l.medTitle1,
        description: l.medDesc1,
        category: l.medCat1,
        audioAsset: _audioPath(context, 'meditation_morning.mp3'),
        gradient: const LinearGradient(
            colors: [Color(0xFFF57C00), Color(0xFFFFC107)]),
      ),
      _MeditationEntry(
        emoji: '🌙',
        title: l.medTitle2,
        description: l.medDesc2,
        category: l.medCat2,
        audioAsset: _audioPath(context, 'meditation_sleep.mp3'),
        gradient: const LinearGradient(
            colors: [Color(0xFF1A237E), Color(0xFF4A148C)]),
      ),
      _MeditationEntry(
        emoji: '😰',
        title: l.medTitle3,
        description: l.medDesc3,
        category: l.medCat3,
        audioAsset: _audioPath(context, 'meditation_anxiety.mp3'),
        gradient: const LinearGradient(
            colors: [Color(0xFF1565C0), Color(0xFF42A5F5)]),
      ),
      _MeditationEntry(
        emoji: '🎯',
        title: l.medTitle4,
        description: l.medDesc4,
        category: l.medCat4,
        audioAsset: _audioPath(context, 'meditation_focus.mp3'),
        gradient: const LinearGradient(
            colors: [Color(0xFF2E7D32), Color(0xFF66BB6A)]),
      ),
      _MeditationEntry(
        emoji: '💪',
        title: l.medTitle5,
        description: l.medDesc5,
        category: l.medCat5,
        audioAsset: _audioPath(context, 'meditation_body_scan.mp3'),
        gradient: const LinearGradient(
            colors: [Color(0xFF4A148C), Color(0xFFB39DDB)]),
      ),
    ];

    return Scaffold(
      backgroundColor: context.bg,
      appBar: AppBar(
        title: Text(l.meditationLibrary),
        backgroundColor: Colors.transparent,
      ),
      body: BlocListener<MeditationBloc, MeditationState>(
        listener: (context, state) {
          if (state is MeditationDone) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('${state.title} ✓'),
                backgroundColor: AppColors.sageGreen,
              ),
            );
          }
          if (state is MeditationError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.message),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: BlocBuilder<MeditationBloc, MeditationState>(
          builder: (context, state) {
            // Determine which meditation is currently active
            String? activeAsset;
            bool isPlaying = false;
            if (state is MeditationPlaying) {
              activeAsset = state.audioAsset;
              isPlaying = true;
            } else if (state is MeditationPaused) {
              activeAsset = state.audioAsset;
              isPlaying = false;
            } else if (state is MeditationLoading) {
              isPlaying = true;
            }

            return ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: meditations.length,
              itemBuilder: (context, index) {
                final m = meditations[index];
                final isActive = activeAsset == m.audioAsset;
                final isThisPlaying = isActive && isPlaying;

                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  decoration: BoxDecoration(
                    gradient: m.gradient,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        final bloc = context.read<MeditationBloc>();
                        if (isThisPlaying) {
                          bloc.add(const PauseMeditation());
                        } else if (isActive && !isPlaying) {
                          bloc.add(const ResumeMeditation());
                        } else {
                          bloc.add(PlayMeditation(
                            title: m.title,
                            audioAsset: m.audioAsset,
                          ));
                        }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: Row(
                          children: [
                            Text(m.emoji, style: const TextStyle(fontSize: 36)),
                            const SizedBox(width: 14),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    m.title,
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                  const SizedBox(height: 3),
                                  Text(
                                    m.description,
                                    style: TextStyle(
                                      color: Colors.white.withOpacity(0.8),
                                      fontSize: 12,
                                    ),
                                  ),
                                  const SizedBox(height: 6),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8, vertical: 3),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.2),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Text(
                                      m.category,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 11,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            // Play / Pause / Stop button
                            isActive
                                ? Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Icon(
                                        isThisPlaying
                                            ? Icons.pause_circle_filled_rounded
                                            : Icons.play_circle_filled_rounded,
                                        color: Colors.white.withOpacity(0.9),
                                        size: 40,
                                      ),
                                      const SizedBox(width: 4),
                                      GestureDetector(
                                        onTap: () => context
                                            .read<MeditationBloc>()
                                            .add(const StopMeditation()),
                                        child: Icon(
                                          Icons.stop_circle_rounded,
                                          color: Colors.white.withOpacity(0.6),
                                          size: 30,
                                        ),
                                      ),
                                    ],
                                  )
                                : Icon(
                                    Icons.play_circle_filled_rounded,
                                    color: Colors.white.withOpacity(0.9),
                                    size: 40,
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
                    .animate(delay: Duration(milliseconds: 80 * index))
                    .fadeIn(duration: 400.ms)
                    .slideY(begin: 0.1, end: 0);
              },
            );
          },
        ),
      ),
    );
  }
}

class _MeditationEntry {
  const _MeditationEntry({
    required this.emoji,
    required this.title,
    required this.description,
    required this.category,
    required this.audioAsset,
    required this.gradient,
  });

  final String emoji;
  final String title;
  final String description;
  final String category;
  final String audioAsset;
  final LinearGradient gradient;
}
