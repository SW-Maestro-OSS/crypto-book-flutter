import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';

part 'app_settings_provider.g.dart';

/// 앱 전역 설정 상태
class AppSettings {
  final String currency;
  final String language;
  final ExchangeRateEntity? exchangeRate;

  const AppSettings({
    required this.currency,
    required this.language,
    this.exchangeRate,
  });

  AppSettings copyWith({
    String? currency,
    String? language,
    ExchangeRateEntity? exchangeRate,
  }) {
    return AppSettings(
      currency: currency ?? this.currency,
      language: language ?? this.language,
      exchangeRate: exchangeRate ?? this.exchangeRate,
    );
  }
}

/// 앱 전역 설정 Provider
@Riverpod(keepAlive: true)
class AppSettingsNotifier extends _$AppSettingsNotifier {
  @override
  AppSettings build() {
    return const AppSettings(
      currency: 'USD',
      language: 'en',
      exchangeRate: null,
    );
  }

  void updateCurrency(String currency, {ExchangeRateEntity? exchangeRate}) {
    state = state.copyWith(
      currency: currency,
      exchangeRate: exchangeRate,
    );
  }

  void updateLanguage(String language) {
    state = state.copyWith(language: language);
  }

  void updateExchangeRate(ExchangeRateEntity exchangeRate) {
    state = state.copyWith(exchangeRate: exchangeRate);
  }
}
