import 'package:flutter/material.dart';
import 'package:presentation/theme/colors/app_colors.dart';
import 'package:presentation/theme/typography/app_typography.dart';
import 'package:presentation/theme/extensions/crypto_theme_extension.dart';

class AppTheme {
  // Private constructor to prevent instantiation
  AppTheme._();

  // Light Theme
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: AppColors.lightColorScheme,
      textTheme: AppTypography.lightTextTheme,
      scaffoldBackgroundColor: AppColors.lightBackground,
      // Card Theme
      cardTheme: CardThemeData(
        color: AppColors.lightCardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      // AppBar Theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.lightColorScheme.surface,
        foregroundColor: AppColors.lightColorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.lightTextTheme.titleLarge,
      ),
      // Bottom Navigation Bar Theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.lightColorScheme.surface,
        selectedItemColor: AppColors.lightColorScheme.primary,
        unselectedItemColor:
            AppColors.lightColorScheme.onSurface.withOpacity(0.6),
        selectedLabelStyle: AppTypography.lightTextTheme.labelMedium,
        unselectedLabelStyle: AppTypography.lightTextTheme.labelMedium,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      // List Tile Theme
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        dense: false,
        titleTextStyle: AppTypography.lightTextTheme.bodyLarge,
        subtitleTextStyle: AppTypography.lightTextTheme.bodySmall,
      ),
      // Divider Theme
      dividerTheme: DividerThemeData(
        color: AppColors.lightColorScheme.outline.withOpacity(0.3),
        thickness: 1,
        space: 1,
      ),
      // Icon Theme
      iconTheme: IconThemeData(
        color: AppColors.lightColorScheme.onSurface,
        size: 24,
      ),
      // Extensions
      extensions: <ThemeExtension<dynamic>>[
        CryptoThemeExtension.light(),
      ],
    );
  }

  // Dark Theme
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: AppColors.darkColorScheme,
      textTheme: AppTypography.darkTextTheme,
      scaffoldBackgroundColor: AppColors.darkBackground,
      cardTheme: CardThemeData(
        color: AppColors.darkCardBackground,
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.darkColorScheme.surface,
        foregroundColor: AppColors.darkColorScheme.onSurface,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.darkTextTheme.titleLarge,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.darkColorScheme.surface,
        selectedItemColor: AppColors.darkColorScheme.primary,
        unselectedItemColor:
            AppColors.darkColorScheme.onSurface.withOpacity(0.6),
        selectedLabelStyle: AppTypography.darkTextTheme.labelMedium,
        unselectedLabelStyle: AppTypography.darkTextTheme.labelMedium,
        type: BottomNavigationBarType.fixed,
        elevation: 8,
      ),
      listTileTheme: ListTileThemeData(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16),
        dense: false,
        titleTextStyle: AppTypography.darkTextTheme.bodyLarge,
        subtitleTextStyle: AppTypography.darkTextTheme.bodySmall,
      ),
      dividerTheme: DividerThemeData(
        color: AppColors.darkColorScheme.outline.withOpacity(0.3),
        thickness: 1,
        space: 1,
      ),
      iconTheme: IconThemeData(
        color: AppColors.darkColorScheme.onSurface,
        size: 24,
      ),
      extensions: <ThemeExtension<dynamic>>[
        CryptoThemeExtension.dark(),
      ],
    );
  }
}
