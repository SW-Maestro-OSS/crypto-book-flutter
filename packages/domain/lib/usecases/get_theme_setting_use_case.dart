import 'package:domain/entities/theme_setting_entity.dart';
import 'package:domain/repositories/settings_repository.dart';

/// Get theme setting use case interface
abstract interface class GetThemeSettingUseCase {
  ThemeSettingEntity call();
}

/// Get theme setting use case implementation
class GetThemeSettingUseCaseImpl implements GetThemeSettingUseCase {
  final SettingsRepository repository;

  GetThemeSettingUseCaseImpl({required this.repository});

  @override
  ThemeSettingEntity call() {
    return repository.getThemeSetting();
  }
}
