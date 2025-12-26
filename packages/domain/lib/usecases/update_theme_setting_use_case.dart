import 'package:domain/entities/theme_setting_entity.dart';
import 'package:domain/repositories/settings_repository.dart';

/// Update theme setting use case interface
abstract interface class UpdateThemeSettingUseCase {
  Future<void> call(ThemeSettingEntity setting);
}

/// Update theme setting use case implementation
class UpdateThemeSettingUseCaseImpl implements UpdateThemeSettingUseCase {
  final SettingsRepository repository;

  UpdateThemeSettingUseCaseImpl({required this.repository});

  @override
  Future<void> call(ThemeSettingEntity setting) async {
    await repository.updateThemeSetting(setting);
  }
}
