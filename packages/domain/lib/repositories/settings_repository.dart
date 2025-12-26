import 'package:domain/entities/theme_setting_entity.dart';

/// Settings repository interface
///
/// Manages user settings (theme, language, currency, etc.)
abstract interface class SettingsRepository {
  /// Get current theme setting (synchronous - reads from cache)
  ThemeSettingEntity getThemeSetting();

  /// Update theme setting
  Future<void> updateThemeSetting(ThemeSettingEntity setting);

  /// Clear theme setting (reset to default)
  Future<void> clearThemeSetting();
}
