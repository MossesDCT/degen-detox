import 'package:flutter/material.dart';

/// App color palette for Cortisol Zero.
/// Soft, soothing colors inspired by nature: sage greens, muted blues, warm creams, soft lavender.
class AppColors {
  AppColors._();

  // ── Sage Greens ──────────────────────────────────────────────────────────
  static const Color sageGreen = Color(0xFF8FBC8F);
  static const Color mintGreen = Color(0xFFA8D5BA);
  static const Color deepSage = Color(0xFF6B9E6B);
  static const Color lightSage = Color(0xFFC8E6C9);

  // ── Muted Blues ──────────────────────────────────────────────────────────
  static const Color skyBlue = Color(0xFF87CEEB);
  static const Color oceanBlue = Color(0xFF6B9AC4);
  static const Color lightBlue = Color(0xFFBBDEFB);
  static const Color deepBlue = Color(0xFF5B8DB8);

  // ── Warm Creams ──────────────────────────────────────────────────────────
  static const Color warmCream = Color(0xFFFFF8DC);
  static const Color softCream = Color(0xFFFAF0E6);
  static const Color peach = Color(0xFFFFE4C4);
  static const Color linen = Color(0xFFFAF0E6);

  // ── Soft Lavender ────────────────────────────────────────────────────────
  static const Color lavender = Color(0xFFE6E6FA);
  static const Color deepLavender = Color(0xFFB39DDB);
  static const Color lilac = Color(0xFFD1C4E9);

  // ── Neutrals ─────────────────────────────────────────────────────────────
  static const Color textPrimary = Color(0xFF2D3748);
  static const Color textSecondary = Color(0xFF718096);
  static const Color textLight = Color(0xFFA0AEC0);
  static const Color divider = Color(0xFFE2E8F0);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color background = Color(0xFFF7F9F7);

  // ── Semantic ─────────────────────────────────────────────────────────────
  static const Color success = Color(0xFF68D391);
  static const Color warning = Color(0xFFF6AD55);
  static const Color error = Color(0xFFFC8181);
  static const Color info = Color(0xFF63B3ED);

  // ── PRO Badge ────────────────────────────────────────────────────────────
  static const Color proBadge = Color(0xFFD4AF37);
  static const Color proBadgeLight = Color(0xFFFFF3CD);

  // ── Mood Colors ──────────────────────────────────────────────────────────
  static const Color moodGreat = Color(0xFF68D391);
  static const Color moodGood = Color(0xFFA8D5BA);
  static const Color moodOkay = Color(0xFFF6E05E);
  static const Color moodBad = Color(0xFFF6AD55);
  static const Color moodTerrible = Color(0xFFFC8181);

  // ── Gradients ─────────────────────────────────────────────────────────────
  static const LinearGradient primaryGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [sageGreen, mintGreen],
  );

  static const LinearGradient backgroundGradient = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFFF0F7F0), warmCream],
  );

  static const LinearGradient calmGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [skyBlue, lavender],
  );

  static const LinearGradient breatheInhaleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF87CEEB), Color(0xFF6B9AC4)],
  );

  static const LinearGradient breatheHoldGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFB39DDB), Color(0xFFE6E6FA)],
  );

  static const LinearGradient breatheExhaleGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFA8D5BA), Color(0xFF8FBC8F)],
  );

  static const LinearGradient oceanGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF1A6B8A), Color(0xFF87CEEB)],
  );

  static const LinearGradient rainGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF5B8DB8), Color(0xFFBBDEFB)],
  );

  static const LinearGradient campfireGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFFE65100), Color(0xFFF6AD55)],
  );

  static const LinearGradient birdsGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF81C784), Color(0xFFF9A825)],
  );

  static const LinearGradient forestGradient = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [Color(0xFF2E7D32), Color(0xFFA8D5BA)],
  );

  // ── Dark Mode ─────────────────────────────────────────────────────────────
  static const Color darkBackground = Color(0xFF1A2421);
  static const Color darkSurface = Color(0xFF243320);
  static const Color darkCard = Color(0xFF2D3E2A);
  static const Color darkTextPrimary = Color(0xFFE8F5E9);
  static const Color darkTextSecondary = Color(0xFFA5C5A5);
}
