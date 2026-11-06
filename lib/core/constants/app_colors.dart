import 'package:flutter/material.dart';

class AppColors {
  // Backgrounds
  static const Color background = Color(0xFFF8F7FD);
  static const Color surface = Colors.white;
  static const Color surfaceDark = Color(0xFF161226);
  static const Color cardDark = Color(0xFF1B1630);

  // Primaries & Purples
  static const Color primary = Color(0xFF6B38FB);
  static const Color primaryLight = Color(0xFF8B5CF6);
  static const Color primaryGradientStart = Color(0xFF7C3AED);
  static const Color primaryGradientEnd = Color(0xFF9333EA);
  static const Color lavender = Color(0xFFEDE9FE);
  static const Color lavenderLight = Color(0xFFF5F3FF);
  static const Color backgroundPurples = Color(0xFFF3E8FF);

  // Accents
  static const Color lotusPink = Color(0xFFEC4899);
  static const Color lotusPinkLight = Color(0xFFFDE8E8);
  static const Color liveCyan = Color(0xFF00D2B4);
  static const Color amberBadge = Color(0xFFF59E0B);
  static const Color amberBadgeLight = Color(0xFFFEF3C7);
  static const Color softBlue = Color(0xFF3B82F6);
  static const Color softBlueLight = Color(0xFFDBEAFE);

  // Text
  static const Color textPrimary = Color(0xFF161325);
  static const Color textSecondary = Color(0xFF757186);
  static const Color textMuted = Color(0xFFA19CAB);
  static const Color textWhite = Colors.white;

  // Banner

  static const Color bannerDarkBlue = Color(0xFF1E1B4B);
  static const Color bannerBlue = Color(0xFF0F172A);
  static const Color bannerlightBlue = Color(0xFF3B0764);

  // Borders & Dividers
  static const Color border = Color(0xFFE9E5F4);
  static const Color divider = Color(0xFFF0EDF8);

  // Shadows
  static const BoxShadow softShadow = BoxShadow(
    color: Color(0x0C000000),
    blurRadius: 18,
    offset: Offset(0, 6),
  );

  static const BoxShadow cardGlow = BoxShadow(
    color: Color(0x1F6B38FB),
    blurRadius: 20,
    offset: Offset(0, 8),
  );
}
