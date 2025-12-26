import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class ThemePreferenceService {
  static const String _boxName = 'app_preferences';
  static const String _themeModeKey = 'theme_mode';

  Box<String>? _prefsBox;

  // Initialize Hive box
  Future<void> init() async {
    try {
      _prefsBox = await Hive.openBox<String>(_boxName);
    } catch (e) {
      print('ThemePreferenceService init failed: $e');
    }
  }

  // Get saved theme mode (returns null if not set - defaults to system)
  ThemeMode? getSavedThemeMode() {
    if (_prefsBox == null) return null;

    final savedValue = _prefsBox!.get(_themeModeKey);
    if (savedValue == null) return null;

    switch (savedValue) {
      case 'light':
        return ThemeMode.light;
      case 'dark':
        return ThemeMode.dark;
      case 'system':
        return ThemeMode.system;
      default:
        return null;
    }
  }

  // Save theme mode
  Future<void> saveThemeMode(ThemeMode mode) async {
    if (_prefsBox == null) return;

    final String value;
    switch (mode) {
      case ThemeMode.light:
        value = 'light';
        break;
      case ThemeMode.dark:
        value = 'dark';
        break;
      case ThemeMode.system:
        value = 'system';
        break;
    }

    await _prefsBox!.put(_themeModeKey, value);
  }

  // Clear saved preference
  Future<void> clearThemeMode() async {
    if (_prefsBox == null) return;
    await _prefsBox!.delete(_themeModeKey);
  }

  // Dispose
  Future<void> dispose() async {
    await _prefsBox?.close();
  }
}
