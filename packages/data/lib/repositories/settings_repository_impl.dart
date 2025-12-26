import 'package:domain/domain.dart';
import 'package:data/datasources/settings_local_data_source.dart';

/// Settings repository implementation
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsLocalDataSource localDataSource;

  SettingsRepositoryImpl({required this.localDataSource});

  @override
  ThemeSettingEntity getThemeSetting() {
    final savedValue = localDataSource.getThemeMode();

    // Parse saved value to ThemeMode
    final ThemeMode themeMode;
    switch (savedValue) {
      case 'light':
        themeMode = ThemeMode.light;
        break;
      case 'dark':
        themeMode = ThemeMode.dark;
        break;
      case 'system':
        themeMode = ThemeMode.system;
        break;
      default:
        // Default to system if not set
        themeMode = ThemeMode.system;
    }

    return ThemeSettingEntity(themeMode: themeMode);
  }

  @override
  Future<void> updateThemeSetting(ThemeSettingEntity setting) async {
    // Convert ThemeMode to string for storage
    final String value;
    switch (setting.themeMode) {
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

    await localDataSource.saveThemeMode(value);
  }

  @override
  Future<void> clearThemeSetting() async {
    await localDataSource.clearThemeMode();
  }
}
