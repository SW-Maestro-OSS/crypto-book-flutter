import 'package:flutter/material.dart' as flutter;
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/providers/usecase_providers.dart';

part 'theme_mode_provider.g.dart';

// Theme Mode State Provider
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  flutter.ThemeMode build() {
    // Load saved preference or default to system
    try {
      final useCase = ref.read(getThemeSettingUseCaseProvider);
      final setting = useCase();
      return _toFlutterThemeMode(setting.themeMode);
    } catch (e) {
      // Default to system on error
      return flutter.ThemeMode.system;
    }
  }

  /// Set theme mode
  Future<void> setThemeMode(flutter.ThemeMode mode) async {
    state = mode;

    // Save via UseCase
    final useCase = ref.read(updateThemeSettingUseCaseProvider);
    final domainMode = _toDomainThemeMode(mode);
    await useCase(ThemeSettingEntity(themeMode: domainMode));
  }

  /// Toggle between light/dark (ignores system)
  Future<void> toggleTheme() async {
    final newMode = state == flutter.ThemeMode.light
        ? flutter.ThemeMode.dark
        : flutter.ThemeMode.light;
    await setThemeMode(newMode);
  }

  /// Convert Domain ThemeMode to Flutter ThemeMode
  flutter.ThemeMode _toFlutterThemeMode(ThemeMode domainMode) {
    switch (domainMode) {
      case ThemeMode.light:
        return flutter.ThemeMode.light;
      case ThemeMode.dark:
        return flutter.ThemeMode.dark;
      case ThemeMode.system:
        return flutter.ThemeMode.system;
    }
  }

  /// Convert Flutter ThemeMode to Domain ThemeMode
  ThemeMode _toDomainThemeMode(flutter.ThemeMode flutterMode) {
    switch (flutterMode) {
      case flutter.ThemeMode.light:
        return ThemeMode.light;
      case flutter.ThemeMode.dark:
        return ThemeMode.dark;
      case flutter.ThemeMode.system:
        return ThemeMode.system;
    }
  }
}
