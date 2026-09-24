import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:go_router/go_router.dart';

import '../../../../config/di.dart';
import '../../../../core/widgets/breathing_circle.dart';
import '../../domain/entities/breathing_technique.dart';
import '../bloc/breathing_bloc.dart';
import '../widgets/phase_indicator.dart';
import '../../../../core/localization/app_localizations_helper.dart';
import '../../../../core/theme/theme_helper.dart';

/// Full-screen interactive breathing session page.
///
/// Features:
/// - Large animated circle that expands/contracts with breathing phases
/// - Phase label and countdown timer
/// - Cycle counter with progress
/// - Background gradient that shifts with phases
/// - Haptic feedback on phase transitions
/// - Session complete summary
class BreathingSessionPage extends StatelessWidget {
  const BreathingSessionPage({super.key, this.technique});

  final BreathingTechnique? technique;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) {
        final bloc = sl<BreathingBloc>();
        if (technique != null) {
          bloc.add(StartBreathingSession(technique!));
        } else {
          bloc.add(const LoadBreathingTechniques());
        }
        return bloc;
      },
      child: const _SessionView(),
    );
  }
}

class _SessionView extends StatefulWidget {
  const _SessionView();

  @override
  State<_SessionView> createState() => _SessionViewState();
}

class _SessionViewState extends State<_SessionView> {
  SessionPhase _lastPhase = SessionPhase.idle;

  // Provide haptic feedback when phase changes
  void _onPhaseChange(SessionPhase newPhase) {
    if (newPhase != _lastPhase) {
      HapticFeedback.lightImpact();
      _lastPhase = newPhase;
    }
  }

  BreathingPhase _toBreathingPhase(SessionPhase phase) {
    switch (phase) {
      case SessionPhase.inhale:
        return BreathingPhase.inhale;
      case SessionPhase.hold:
        return BreathingPhase.hold;
      case SessionPhase.exhale:
        return BreathingPhase.exhale;
      case SessionPhase.holdAfterExhale:
        return BreathingPhase.holdAfterExhale;
      case SessionPhase.idle:
      case SessionPhase.complete:
        return BreathingPhase.idle;
    }
  }

  List<Color> _gradientColors(SessionPhase phase) {
    switch (phase) {
      case SessionPhase.inhale:
        return [const Color(0xFF1565C0), const Color(0xFF42A5F5)];
      case SessionPhase.hold:
        return [const Color(0xFF4A148C), const Color(0xFF9C27B0)];
      case SessionPhase.exhale:
        return [const Color(0xFF1B5E20), const Color(0xFF4CAF50)];
      case SessionPhase.holdAfterExhale:
        return [const Color(0xFF2E7D32), const Color(0xFF8FBC8F)];
      case SessionPhase.idle:
        return [const Color(0xFF1B5E20), const Color(0xFF4CAF50)];
      case SessionPhase.complete:
        return [const Color(0xFF1B5E20), const Color(0xFF66BB6A)];
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<BreathingBloc, BreathingState>(
      listener: (context, state) {
        if (state is BreathingSessionActive) {
          _onPhaseChange(state.phase);
        }
      },
      builder: (context, state) {
        if (state is BreathingSessionComplete) {
          return _CompletionScreen(state: state);
        }

        if (state is BreathingSessionActive) {
          final technique = state.technique;
          final gradientColors = _gradientColors(state.phase);

          return Scaffold(
            body: AnimatedContainer(
              duration: const Duration(milliseconds: 800),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: gradientColors,
                ),
              ),
              child: SafeArea(
                child: Column(
                  children: [
                    // Top bar
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            icon: const Icon(Icons.close,
                                color: Colors.white, size: 28),
                            onPressed: () {
                              context
                                  .read<BreathingBloc>()
                                  .add(const StopBreathingSession());
                              context.pop();
                            },
                          ),
                          Column(
                            children: [
                              Text(
                                technique.name,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                context.l10n.cycleOf(state.completedCycles + 1,
                                    state.totalCycles),
                                style: TextStyle(
                                  color: Colors.white.withOpacity(0.7),
                                  fontSize: 12,
                                ),
                              ),
                            ],
                          ),
                          // Cycle progress dots
                          _CycleProgressDots(
                            total: state.totalCycles,
                            completed: state.completedCycles,
                          ),
                        ],
                      ),
                    ),

                    // Progress bar
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: LinearProgressIndicator(
                          value: state.cycleProgress,
                          backgroundColor: Colors.white.withOpacity(0.2),
                          valueColor:
                              const AlwaysStoppedAnimation<Color>(Colors.white),
                          minHeight: 3,
                        ),
                      ),
                    ),

                    const Spacer(),

                    // Animated breathing circle
                    BreathingCircle(
                      phase: _toBreathingPhase(state.phase),
                      phaseDurationSeconds: state.remainingSeconds + 1,
                    ),

                    const SizedBox(height: 32),

                    // Phase indicator
                    PhaseIndicator(
                      phaseName: state.phaseName,
                      phaseInstruction: state.phaseInstruction,
                      remainingSeconds: state.remainingSeconds,
                      phase: state.phase,
                      primaryColor: technique.primaryColor,
                    ),

                    const Spacer(),

                    // Bottom controls
                    Padding(
                      padding: const EdgeInsets.only(bottom: 40),
                      child: TextButton.icon(
                        onPressed: () {
                          context
                              .read<BreathingBloc>()
                              .add(const StopBreathingSession());
                          context.pop();
                        },
                        icon: const Icon(Icons.stop_rounded,
                            color: Colors.white54),
                        label: Text(
                          context.l10n.endSession,
                          style: const TextStyle(color: Colors.white54),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }

        // Loading/initial state
        return Scaffold(
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Color(0xFF1B5E20), Color(0xFF4CAF50)],
              ),
            ),
            child: const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
          ),
        );
      },
    );
  }
}

/// Cycle progress dots indicator.
class _CycleProgressDots extends StatelessWidget {
  const _CycleProgressDots({required this.total, required this.completed});

  final int total;
  final int completed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(total.clamp(0, 8), (index) {
        return Container(
          margin: const EdgeInsets.only(left: 4),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: index < completed
                ? Colors.white
                : Colors.white.withOpacity(0.3),
          ),
        );
      }),
    );
  }
}

/// Session completion screen.
class _CompletionScreen extends StatelessWidget {
  const _CompletionScreen({required this.state});

  final BreathingSessionComplete state;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final l = context.l10n;
    final minutes = state.totalDurationSeconds ~/ 60;
    final seconds = state.totalDurationSeconds % 60;
    final durationStr = minutes > 0
        ? '$minutes ${l.durationMin} $seconds ${l.durationSec}'
        : '$seconds ${l.durationSec}';

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF1B5E20), Color(0xFF2E7D32)],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('✨', style: TextStyle(fontSize: 64))
                    .animate()
                    .scale(duration: 600.ms, curve: Curves.elasticOut),

                const SizedBox(height: 24),

                Text(
                  context.l10n.sessionComplete,
                  style: theme.textTheme.headlineMedium?.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w800,
                  ),
                ).animate(delay: 200.ms).fadeIn(duration: 400.ms),

                const SizedBox(height: 8),

                Text(
                  context.l10n.sessionCompleteMessage,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white.withOpacity(0.85),
                    fontSize: 15,
                    height: 1.5,
                  ),
                ).animate(delay: 300.ms).fadeIn(duration: 400.ms),

                const SizedBox(height: 40),

                // Stats
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _StatBubble(
                      value: '${state.completedCycles}',
                      label: context.l10n.cyclesCompleted,
                    ),
                    const SizedBox(width: 20),
                    _StatBubble(
                      value: durationStr,
                      label: context.l10n.duration,
                    ),
                  ],
                ).animate(delay: 400.ms).fadeIn(duration: 400.ms),

                const SizedBox(height: 48),

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () => context.pop(),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      foregroundColor: const Color(0xFF1B5E20),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                      ),
                    ),
                    child: Text(
                      context.l10n.done,
                      style: const TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ).animate(delay: 500.ms).fadeIn(duration: 400.ms),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _StatBubble extends StatelessWidget {
  const _StatBubble({required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.15),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: Colors.white.withOpacity(0.3)),
      ),
      child: Column(
        children: [
          Text(
            value,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 24,
              fontWeight: FontWeight.w800,
            ),
          ),
          Text(
            label,
            style: TextStyle(
              color: Colors.white.withOpacity(0.7),
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
