import 'package:domain/domain.dart';
import 'package:data/datasources/settings_data_source.dart';

/// Settings Repository Implementation
class SettingsRepositoryImpl implements SettingsRepository {
  final SettingsDataSource dataSource;

  SettingsRepositoryImpl({required this.dataSource});

  @override
  Future<String> getCurrency() {
    return dataSource.getCurrency();
  }

  @override
  Future<void> setCurrency(String currency) {
    return dataSource.setCurrency(currency);
  }

  @override
  Future<String> getLanguage() {
    return dataSource.getLanguage();
  }

  @override
  Future<void> setLanguage(String language) {
    return dataSource.setLanguage(language);
  }
}
