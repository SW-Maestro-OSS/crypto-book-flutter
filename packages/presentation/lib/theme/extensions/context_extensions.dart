import 'package:flutter/material.dart';
import 'package:presentation/theme/extensions/crypto_theme_extension.dart';

extension ThemeContextExtension on BuildContext {
  // Theme access
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;

  // Crypto theme extension
  CryptoThemeExtension get cryptoTheme =>
      Theme.of(this).extension<CryptoThemeExtension>()!;

  // Brightness check
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
  bool get isLightMode => !isDarkMode;

  // Convenience getters for common colors
  Color get primaryColor => colorScheme.primary;
  Color get backgroundColor => colorScheme.surface;
  Color get errorColor => colorScheme.error;

  // Crypto-specific helpers
  Color priceChangeColor(double change) {
    if (change > 0) return cryptoTheme.priceUpColor;
    if (change < 0) return cryptoTheme.priceDownColor;
    return cryptoTheme.priceNeutralColor;
  }
}
