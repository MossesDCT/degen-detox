import 'package:flutter/material.dart';
import '../bloc/breathing_bloc.dart';
import '../../../../core/theme/theme_helper.dart';

/// Visual indicator for the current breathing phase.
class PhaseIndicator extends StatelessWidget {
  const PhaseIndicator({
    super.key,
    required this.phaseName,
    required this.phaseInstruction,
    required this.remainingSeconds,
    required this.phase,
    required this.primaryColor,
  });

  final String phaseName;
  final String phaseInstruction;
  final int remainingSeconds;
  final SessionPhase phase;
  final Color primaryColor;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      children: [
        AnimatedSwitcher(
          duration: const Duration(milliseconds: 400),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: SlideTransition(
              position: Tween<Offset>(
                begin: const Offset(0, 0.3),
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut,
              )),
              child: child,
            ),
          ),
          child: Text(
            phaseName,
            key: ValueKey(phaseName),
            style: theme.textTheme.headlineLarge?.copyWith(
              color: Colors.white,
              fontWeight: FontWeight.w800,
              letterSpacing: 2,
            ),
          ),
        ),

        const SizedBox(height: 8),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          child: Text(
            phaseInstruction,
            key: ValueKey(phaseInstruction),
            textAlign: TextAlign.center,
            style: theme.textTheme.bodyMedium?.copyWith(
              color: Colors.white.withOpacity(0.8),
              height: 1.5,
            ),
          ),
        ),

        const SizedBox(height: 20),

        // Countdown timer
        Container(
          width: 64,
          height: 64,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white.withOpacity(0.15),
            border: Border.all(
              color: Colors.white.withOpacity(0.4),
              width: 2,
            ),
          ),
          child: Center(
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: Text(
                '$remainingSeconds',
                key: ValueKey(remainingSeconds),
                style: theme.textTheme.headlineSmall?.copyWith(
                  color: Colors.white,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
