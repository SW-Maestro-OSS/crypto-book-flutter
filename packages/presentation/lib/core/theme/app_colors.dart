import 'package:flutter/material.dart';

/// App-wide color constants based on Figma design
class AppColors {
  AppColors._();

  // Primary colors
  static const Color primary = Color(0xFF3B82F6); // Blue
  static const Color primaryDark = Color(0xFF2563EB);
  static const Color primaryLight = Color(0xFF60A5FA);

  // Background colors
  static const Color background = Color(0xFFFFFFFF);
  static const Color backgroundSecondary = Color(0xFFF8F9FA);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color surfaceElevated = Color(0xFFF8F9FA);

  // Text colors
  static const Color textPrimary = Color(0xFF1F2937);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color textTertiary = Color(0xFF9CA3AF);
  static const Color textDisabled = Color(0xFFD1D5DB);

  // Price change colors
  static const Color priceUp = Color(0xFF22C55E); // Green
  static const Color priceDown = Color(0xFFE11919); // Red
  static const Color priceFlat = Color(0xFF6B7280); // Gray

  // Badge/Chip colors
  static const Color badgeUpBackground = Color(0xFFDCFCE7);
  static const Color badgeDownBackground = Color(0xFFFEE2E2);
  static const Color badgeFlatBackground = Color(0xFFF3F4F6);

  // Border colors
  static const Color border = Color(0xFFE5E7EB);
  static const Color borderLight = Color(0xFFF3F4F6);
  static const Color borderDark = Color(0xFFD1D5DB);

  // Semantic colors
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color warning = Color(0xFFF59E0B);
  static const Color info = Color(0xFF3B82F6);

  // Connection state colors
  static const Color connected = Color(0xFF22C55E);
  static const Color connecting = Color(0xFFF59E0B);
  static const Color disconnected = Color(0xFF6B7280);
  static const Color reconnecting = Color(0xFFF97316);
  static const Color connectionError = Color(0xFFEF4444);

  // Chart colors
  static const Color chartLine = Color(0xFF3B82F6);
  static const Color chartGrid = Color(0xFFE5E7EB);
  static const Color chartBackground = Color(0xFFFFFFFF);

  /// Get price change color based on change percentage
  static Color getPriceChangeColor(double changePercent) {
    if (changePercent > 0) return priceUp;
    if (changePercent < 0) return priceDown;
    return priceFlat;
  }

  /// Get badge background color based on change percentage
  static Color getBadgeBackgroundColor(double changePercent) {
    if (changePercent > 0) return badgeUpBackground;
    if (changePercent < 0) return badgeDownBackground;
    return badgeFlatBackground;
  }
}
