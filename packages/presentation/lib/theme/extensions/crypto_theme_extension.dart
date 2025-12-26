import 'package:flutter/material.dart';
import 'package:presentation/theme/colors/semantic_colors.dart';

@immutable
class CryptoThemeExtension extends ThemeExtension<CryptoThemeExtension> {
  final Color priceUpColor;
  final Color priceDownColor;
  final Color priceNeutralColor;
  final TextStyle priceTextStyle;
  final TextStyle percentChangeTextStyle;
  final Color volumeTextColor;

  const CryptoThemeExtension({
    required this.priceUpColor,
    required this.priceDownColor,
    required this.priceNeutralColor,
    required this.priceTextStyle,
    required this.percentChangeTextStyle,
    required this.volumeTextColor,
  });

  // Light theme factory
  factory CryptoThemeExtension.light() {
    return const CryptoThemeExtension(
      priceUpColor: SemanticColors.lightPriceUp,
      priceDownColor: SemanticColors.lightPriceDown,
      priceNeutralColor: SemanticColors.lightPriceNeutral,
      priceTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      percentChangeTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      volumeTextColor: Color(0xFF757575),
    );
  }

  // Dark theme factory
  factory CryptoThemeExtension.dark() {
    return const CryptoThemeExtension(
      priceUpColor: SemanticColors.darkPriceUp,
      priceDownColor: SemanticColors.darkPriceDown,
      priceNeutralColor: SemanticColors.darkPriceNeutral,
      priceTextStyle: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
      percentChangeTextStyle: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w500,
      ),
      volumeTextColor: Color(0xFF9E9E9E),
    );
  }

  @override
  CryptoThemeExtension copyWith({
    Color? priceUpColor,
    Color? priceDownColor,
    Color? priceNeutralColor,
    TextStyle? priceTextStyle,
    TextStyle? percentChangeTextStyle,
    Color? volumeTextColor,
  }) {
    return CryptoThemeExtension(
      priceUpColor: priceUpColor ?? this.priceUpColor,
      priceDownColor: priceDownColor ?? this.priceDownColor,
      priceNeutralColor: priceNeutralColor ?? this.priceNeutralColor,
      priceTextStyle: priceTextStyle ?? this.priceTextStyle,
      percentChangeTextStyle:
          percentChangeTextStyle ?? this.percentChangeTextStyle,
      volumeTextColor: volumeTextColor ?? this.volumeTextColor,
    );
  }

  @override
  CryptoThemeExtension lerp(
      ThemeExtension<CryptoThemeExtension>? other, double t) {
    if (other is! CryptoThemeExtension) return this;
    return CryptoThemeExtension(
      priceUpColor: Color.lerp(priceUpColor, other.priceUpColor, t)!,
      priceDownColor: Color.lerp(priceDownColor, other.priceDownColor, t)!,
      priceNeutralColor:
          Color.lerp(priceNeutralColor, other.priceNeutralColor, t)!,
      priceTextStyle:
          TextStyle.lerp(priceTextStyle, other.priceTextStyle, t)!,
      percentChangeTextStyle: TextStyle.lerp(
          percentChangeTextStyle, other.percentChangeTextStyle, t)!,
      volumeTextColor: Color.lerp(volumeTextColor, other.volumeTextColor, t)!,
    );
  }
}
