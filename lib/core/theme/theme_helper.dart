import 'package:flutter/material.dart';
import '../constants/app_colors.dart';

/// Extension on BuildContext that resolves colors based on current theme brightness.
/// Use `context.bg` instead of `AppColors.background`, `context.cardBg` instead of `Colors.white`, etc.
extension ThemeHelper on BuildContext {
  bool get _isDark => Theme.of(this).brightness == Brightness.dark;

  // ── Backgrounds ──────────────────────────────────────────────────────────
  /// Main scaffold / page background
  Color get bg => _isDark ? AppColors.darkBackground : AppColors.background;

  /// Card / container background (replaces `Colors.white`)
  Color get cardBg => _isDark ? AppColors.darkCard : Colors.white;

  /// Surface color
  Color get surfaceBg => _isDark ? AppColors.darkSurface : AppColors.surface;

  // ── Text ──────────────────────────────────────────────────────────────────
  Color get textPrimary =>
      _isDark ? AppColors.darkTextPrimary : AppColors.textPrimary;

  Color get textSecondary =>
      _isDark ? AppColors.darkTextSecondary : AppColors.textSecondary;

  Color get textLight =>
      _isDark ? const Color(0xFF7A9A7A) : AppColors.textLight;

  // ── Divider / Outline ────────────────────────────────────────────────────
  Color get dividerColor =>
      _isDark ? const Color(0xFF3D5C3A) : AppColors.divider;

  // ── Input / Search bar fill ──────────────────────────────────────────────
  Color get inputFill => _isDark ? AppColors.darkSurface : Colors.white;

  // ── Navigation bar ───────────────────────────────────────────────────────
  Color get navBarBg => _isDark ? AppColors.darkSurface : AppColors.surface;

  // ── Chip / filter unselected background ──────────────────────────────────
  Color get chipBg => _isDark ? AppColors.darkSurface : Colors.white;

  // ── Bottom sheet / dialog ────────────────────────────────────────────────
  Color get sheetBg => _isDark ? AppColors.darkSurface : Colors.white;

  // ── Shadow opacity factor ────────────────────────────────────────────────
  double get shadowOpacity => _isDark ? 0.3 : 0.05;
}
