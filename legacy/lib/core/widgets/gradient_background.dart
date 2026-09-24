import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../../core/theme/theme_helper.dart';

/// Reusable gradient background widget.
/// Provides a soft green-to-cream gradient as a page backdrop.
class GradientBackground extends StatelessWidget {
  const GradientBackground({
    super.key,
    required this.child,
    this.gradient,
    this.padding,
  });

  final Widget child;
  final Gradient? gradient;
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: gradient ?? AppColors.backgroundGradient,
      ),
      padding: padding,
      child: child,
    );
  }
}

/// A gradient background that fills the entire screen.
class FullScreenGradient extends StatelessWidget {
  const FullScreenGradient({
    super.key,
    required this.child,
    this.gradient,
  });

  final Widget child;
  final Gradient? gradient;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: gradient ??
            const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color(0xFFF0F7F0),
                Color(0xFFFFF8DC),
                Color(0xFFF5F0FF),
              ],
              stops: [0.0, 0.6, 1.0],
            ),
      ),
      child: child,
    );
  }
}
