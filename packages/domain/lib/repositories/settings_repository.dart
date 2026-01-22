/// Settings Repository Interface
///
/// Manages user preferences such as currency and language settings.
abstract interface class SettingsRepository {
  /// Get the selected currency (e.g., 'USD', 'KRW')
  Future<String> getCurrency();

  /// Set the selected currency
  Future<void> setCurrency(String currency);

  /// Get the selected language (e.g., 'en', 'ko')
  Future<String> getLanguage();

  /// Set the selected language
  Future<void> setLanguage(String language);
}
