import 'package:flutter/material.dart';

class AppColors {
  // Light Theme Colors
  static const ColorScheme lightColorScheme = ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xFF0D47A1), // Deep blue
    onPrimary: Color(0xFFFFFFFF),
    primaryContainer: Color(0xFFBBDEFB),
    onPrimaryContainer: Color(0xFF01579B),
    secondary: Color(0xFF455A64), // Blue grey
    onSecondary: Color(0xFFFFFFFF),
    secondaryContainer: Color(0xFFCFD8DC),
    onSecondaryContainer: Color(0xFF263238),
    tertiary: Color(0xFF00695C), // Teal
    onTertiary: Color(0xFFFFFFFF),
    error: Color(0xFFD32F2F),
    onError: Color(0xFFFFFFFF),
    surface: Color(0xFFFAFAFA),
    onSurface: Color(0xFF212121),
    surfaceContainerHighest: Color(0xFFEEEEEE),
    outline: Color(0xFFBDBDBD),
    shadow: Color(0x29000000),
  );

  // Dark Theme Colors
  static const ColorScheme darkColorScheme = ColorScheme(
    brightness: Brightness.dark,
    primary: Color(0xFF64B5F6), // Lighter blue for dark
    onPrimary: Color(0xFF002F6F),
    primaryContainer: Color(0xFF1565C0),
    onPrimaryContainer: Color(0xFFBBDEFB),
    secondary: Color(0xFF90A4AE),
    onSecondary: Color(0xFF1C2833),
    secondaryContainer: Color(0xFF546E7A),
    onSecondaryContainer: Color(0xFFCFD8DC),
    tertiary: Color(0xFF4DB6AC),
    onTertiary: Color(0xFF003D33),
    error: Color(0xFFEF5350),
    onError: Color(0xFF5F0000),
    surface: Color(0xFF121212),
    onSurface: Color(0xFFE0E0E0),
    surfaceContainerHighest: Color(0xFF1E1E1E),
    outline: Color(0xFF616161),
    shadow: Color(0x52000000),
  );

  // Additional semantic colors
  static const Color lightBackground = Color(0xFFFFFFFF);
  static const Color darkBackground = Color(0xFF121212);

  static const Color lightCardBackground = Color(0xFFFFFFFF);
  static const Color darkCardBackground = Color(0xFF1E1E1E);
}