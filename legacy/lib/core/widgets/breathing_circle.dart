import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Breathing phase enumeration for the animated circle.
enum BreathingPhase { idle, inhale, hold, exhale, holdAfterExhale }

/// An animated breathing circle widget that expands/contracts with configurable timing.
/// Used in breathing exercises to guide the user through phases.
///
/// The circle:
/// - Expands during INHALE phase
/// - Stays large during HOLD (after inhale)
/// - Contracts during EXHALE phase
/// - Stays small during HOLD (after exhale)
class BreathingCircle extends StatefulWidget {
  const BreathingCircle({
    super.key,
    required this.phase,
    required this.phaseDurationSeconds,
    this.minSize = 120.0,
    this.maxSize = 220.0,
    this.phaseColor,
  });

  /// Current breathing phase
  final BreathingPhase phase;

  /// Duration of the current phase in seconds
  final int phaseDurationSeconds;

  /// Minimum circle diameter (resting / exhale size)
  final double minSize;

  /// Maximum circle diameter (full inhale size)
  final double maxSize;

  /// Override the color based on phase (uses defaults if null)
  final Color? phaseColor;

  @override
  State<BreathingCircle> createState() => _BreathingCircleState();
}

class _BreathingCircleState extends State<BreathingCircle>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _sizeAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: widget.phaseDurationSeconds),
    );
    _setupAnimations();
    _startAnimation();
  }

  void _setupAnimations() {
    switch (widget.phase) {
      case BreathingPhase.inhale:
        // Expand from min to max
        _sizeAnimation = Tween<double>(
          begin: widget.minSize,
          end: widget.maxSize,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));
        _opacityAnimation = Tween<double>(begin: 0.6, end: 1.0).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeIn),
        );

      case BreathingPhase.hold:
        // Stay at max size with gentle pulse
        _sizeAnimation = TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(begin: widget.maxSize, end: widget.maxSize + 6),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween(begin: widget.maxSize + 6, end: widget.maxSize),
            weight: 50,
          ),
        ]).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));
        _opacityAnimation = const AlwaysStoppedAnimation(1.0);

      case BreathingPhase.exhale:
        // Contract from max to min
        _sizeAnimation = Tween<double>(
          begin: widget.maxSize,
          end: widget.minSize,
        ).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));
        _opacityAnimation = Tween<double>(begin: 1.0, end: 0.6).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeOut),
        );

      case BreathingPhase.holdAfterExhale:
        // Stay at min size with gentle pulse
        _sizeAnimation = TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(begin: widget.minSize, end: widget.minSize - 6),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween(begin: widget.minSize - 6, end: widget.minSize),
            weight: 50,
          ),
        ]).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));
        _opacityAnimation = const AlwaysStoppedAnimation(0.6);

      case BreathingPhase.idle:
        // Gentle slow pulse
        _sizeAnimation = TweenSequence<double>([
          TweenSequenceItem(
            tween: Tween(begin: widget.minSize, end: widget.minSize + 20),
            weight: 50,
          ),
          TweenSequenceItem(
            tween: Tween(begin: widget.minSize + 20, end: widget.minSize),
            weight: 50,
          ),
        ]).animate(CurvedAnimation(
          parent: _controller,
          curve: Curves.easeInOut,
        ));
        _opacityAnimation = Tween<double>(begin: 0.5, end: 0.8).animate(
          CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
        );
    }
  }

  void _startAnimation() {
    if (widget.phase == BreathingPhase.idle) {
      _controller.repeat(reverse: true);
    } else {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(BreathingCircle oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.phase != widget.phase ||
        oldWidget.phaseDurationSeconds != widget.phaseDurationSeconds) {
      _controller.duration = Duration(seconds: widget.phaseDurationSeconds);
      _controller.reset();
      _setupAnimations();
      _startAnimation();
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Color _getPhaseColor() {
    if (widget.phaseColor != null) return widget.phaseColor!;
    switch (widget.phase) {
      case BreathingPhase.inhale:
        return AppColors.skyBlue;
      case BreathingPhase.hold:
      case BreathingPhase.holdAfterExhale:
        return AppColors.deepLavender;
      case BreathingPhase.exhale:
        return AppColors.sageGreen;
      case BreathingPhase.idle:
        return AppColors.mintGreen;
    }
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        final size = _sizeAnimation.value;
        final opacity = _opacityAnimation is AlwaysStoppedAnimation
            ? (_opacityAnimation as AlwaysStoppedAnimation<double>).value
            : _opacityAnimation.value;
        final color = _getPhaseColor();

        return SizedBox(
          width: widget.maxSize + 40,
          height: widget.maxSize + 40,
          child: Stack(
            alignment: Alignment.center,
            children: [
              // Outermost glow ring
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: size + 36,
                height: size + 36,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.08 * opacity),
                ),
              ),
              // Middle ring
              AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                width: size + 18,
                height: size + 18,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: color.withOpacity(0.14 * opacity),
                ),
              ),
              // Main circle
              Container(
                width: size,
                height: size,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: RadialGradient(
                    colors: [
                      color.withOpacity(0.9 * opacity),
                      color.withOpacity(0.6 * opacity),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      blurRadius: 20,
                      spreadRadius: 4,
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
