import 'package:hive/hive.dart';

/// Settings local data source
///
/// Handles local storage of user settings using Hive
class SettingsLocalDataSource {
  static const String _boxName = 'app_settings';
  static const String _themeModeKey = 'theme_mode';

  Box<String>? _settingsBox;

  /// Initialize Hive box
  Future<void> init() async {
    if (_settingsBox != null) return; // Already initialized
    try {
      _settingsBox = await Hive.openBox<String>(_boxName);
    } catch (e) {
      print('SettingsLocalDataSource init failed: $e');
    }
  }

  /// Get saved theme mode value
  /// Returns: 'light', 'dark', 'system', or null
  String? getThemeMode() {
    // Lazy initialization - open box synchronously if not opened
    if (_settingsBox == null) {
      try {
        _settingsBox = Hive.box<String>(_boxName);
      } catch (e) {
        // Box not opened yet, return null
        print('getThemeMode: Box not opened yet - $e');
        return null;
      }
    }
    final value = _settingsBox!.get(_themeModeKey);
    print('getThemeMode: Retrieved value = $value');
    return value;
  }

  /// Save theme mode value
  Future<void> saveThemeMode(String value) async {
    if (_settingsBox == null) {
      try {
        _settingsBox = Hive.box<String>(_boxName);
      } catch (e) {
        print('saveThemeMode: Box not available - $e');
        return;
      }
    }
    await _settingsBox!.put(_themeModeKey, value);
    print('saveThemeMode: Saved value = $value');
  }

  /// Clear theme mode
  Future<void> clearThemeMode() async {
    if (_settingsBox == null) return;
    await _settingsBox!.delete(_themeModeKey);
  }

  /// Close box
  Future<void> dispose() async {
    await _settingsBox?.close();
  }
}
