import 'package:shared_preferences/shared_preferences.dart';

/// Settings Data Source using SharedPreferences
///
/// Stores user preferences locally on the device.
class SettingsDataSource {
  // SharedPreferences keys
  static const String _currencyKey = 'currency';
  static const String _languageKey = 'language';

  // Default values
  static const String _defaultCurrency = 'USD';
  static const String _defaultLanguage = 'en';

  /// Get the selected currency
  Future<String> getCurrency() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_currencyKey) ?? _defaultCurrency;
  }

  /// Set the selected currency
  Future<void> setCurrency(String currency) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_currencyKey, currency);
  }

  /// Get the selected language
  Future<String> getLanguage() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_languageKey) ?? _defaultLanguage;
  }

  /// Set the selected language
  Future<void> setLanguage(String language) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_languageKey, language);
  }
}
