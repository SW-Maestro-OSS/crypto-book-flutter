import 'package:domain/repositories/settings_repository.dart';

/// Use Case for saving user settings
abstract interface class SaveSettingsUseCase {
  Future<void> setCurrency(String currency);
  Future<void> setLanguage(String language);
}

class SaveSettingsUseCaseImpl implements SaveSettingsUseCase {
  final SettingsRepository repository;

  SaveSettingsUseCaseImpl({required this.repository});

  @override
  Future<void> setCurrency(String currency) {
    return repository.setCurrency(currency);
  }

  @override
  Future<void> setLanguage(String language) {
    return repository.setLanguage(language);
  }
}
