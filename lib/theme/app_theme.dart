import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

/// Design tokens for The Night Trails.
///
/// Palette:
///   ink       #0F1620  — midnight background
///   panel     #1B2A3A  — deep slate blue, alternating section background
///   lantern   #C89B5C  — warm brass/gold accent (the one bold color)
///   parchment #EDE6D8  — warm off-white text on dark
///   sage      #7A8B7F  — muted secondary accent, used sparingly
///   charcoal  #2A2621  — text-on-light / button label color
class AppTheme {
  static const Color ink = Color(0xFF0F1620);
  static const Color panel = Color(0xFF1B2A3A);
  static const Color lantern = Color(0xFFC89B5C);
  static const Color parchment = Color(0xFFEDE6D8);
  static const Color sage = Color(0xFF7A8B7F);
  static const Color charcoal = Color(0xFF2A2621);

  static TextTheme get _textTheme {
    final display = GoogleFonts.fraunces(
      color: parchment,
      fontWeight: FontWeight.w400,
    );
    final body = GoogleFonts.inter(
      color: parchment.withValues(alpha: 0.82),
      height: 1.6,
    );
    return TextTheme(
      displayLarge: display.copyWith(fontSize: 56, height: 1.08),
      displayMedium: display.copyWith(fontSize: 40, height: 1.1),
      headlineMedium: display.copyWith(fontSize: 30, height: 1.15),
      titleLarge: display.copyWith(fontSize: 22),
      bodyLarge: body.copyWith(fontSize: 17),
      bodyMedium: body.copyWith(fontSize: 15),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        letterSpacing: 0.3,
        color: parchment,
        fontWeight: FontWeight.w500,
      ),
    );
  }

  static ThemeData get theme {
    return ThemeData(
      useMaterial3: true,
      scaffoldBackgroundColor: ink,
      colorScheme: ColorScheme.fromSeed(
        seedColor: lantern,
        brightness: Brightness.dark,
        surface: ink,
      ),
      textTheme: _textTheme,
      dividerColor: parchment.withValues(alpha: 0.12),
      splashFactory: NoSplash.splashFactory,
    );
  }
}
