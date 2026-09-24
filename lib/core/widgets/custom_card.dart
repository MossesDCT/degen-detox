import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Reusable card widget with rounded corners, subtle shadow, and optional icon.
class CustomCard extends StatelessWidget {
  const CustomCard({
    super.key,
    required this.child,
    this.padding,
    this.margin,
    this.color,
    this.gradient,
    this.borderRadius,
    this.elevation,
    this.onTap,
    this.icon,
    this.iconColor,
  });

  final Widget child;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final Color? color;
  final Gradient? gradient;
  final BorderRadius? borderRadius;
  final double? elevation;
  final VoidCallback? onTap;
  final IconData? icon;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    final radius = borderRadius ?? BorderRadius.circular(16);

    Widget content = Padding(
      padding: padding ?? const EdgeInsets.all(16),
      child: icon != null
          ? Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: (iconColor ?? AppColors.sageGreen).withOpacity(0.12),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    icon,
                    color: iconColor ?? AppColors.sageGreen,
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(child: child),
              ],
            )
          : child,
    );

    Widget card = Container(
      margin: margin,
      decoration: BoxDecoration(
        color: gradient == null ? (color ?? Colors.white) : null,
        gradient: gradient,
        borderRadius: radius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(elevation == 0 ? 0 : 0.06),
            blurRadius: elevation != null ? elevation! * 3 : 8,
            offset: const Offset(0, 2),
            spreadRadius: 0,
          ),
        ],
      ),
      child: ClipRRect(borderRadius: radius, child: content),
    );

    if (onTap != null) {
      return Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: radius,
          child: card,
        ),
      );
    }

    return card;
  }
}

/// A gradient card variant for featured content.
class GradientCard extends StatelessWidget {
  const GradientCard({
    super.key,
    required this.child,
    required this.gradient,
    this.padding,
    this.margin,
    this.borderRadius,
    this.onTap,
  });

  final Widget child;
  final Gradient gradient;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? margin;
  final BorderRadius? borderRadius;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      gradient: gradient,
      padding: padding,
      margin: margin,
      borderRadius: borderRadius,
      onTap: onTap,
      child: child,
    );
  }
}
