import 'package:domain/repositories/settings_repository.dart';

/// Use Case for getting user settings
abstract interface class GetSettingsUseCase {
  Future<String> getCurrency();
  Future<String> getLanguage();
}

class GetSettingsUseCaseImpl implements GetSettingsUseCase {
  final SettingsRepository repository;

  GetSettingsUseCaseImpl({required this.repository});

  @override
  Future<String> getCurrency() {
    return repository.getCurrency();
  }

  @override
  Future<String> getLanguage() {
    return repository.getLanguage();
  }
}
