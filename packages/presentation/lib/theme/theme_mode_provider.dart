import 'package:flutter/material.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:presentation/theme/persistence/theme_preference_service.dart';

part 'theme_mode_provider.g.dart';

// Theme Preference Service Provider
@riverpod
ThemePreferenceService themePreferenceService(Ref ref) {
  final service = ThemePreferenceService();
  service.init();
  return service;
}

// Theme Mode State Provider
@riverpod
class ThemeModeNotifier extends _$ThemeModeNotifier {
  @override
  ThemeMode build() {
    // Load saved preference or default to system
    final service = ref.read(themePreferenceServiceProvider);
    return service.getSavedThemeMode() ?? ThemeMode.system;
  }

  // Set theme mode
  Future<void> setThemeMode(ThemeMode mode) async {
    state = mode;
    final service = ref.read(themePreferenceServiceProvider);
    await service.saveThemeMode(mode);
  }

  // Toggle between light/dark (ignores system)
  Future<void> toggleTheme() async {
    final newMode =
        state == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    await setThemeMode(newMode);
  }
}
