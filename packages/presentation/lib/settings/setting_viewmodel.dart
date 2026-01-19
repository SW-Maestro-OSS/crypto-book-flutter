import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:domain/domain.dart';
import 'package:presentation/settings/setting_state.dart';
import 'package:presentation/settings/setting_intent.dart';
import 'package:presentation/providers/usecase_providers.dart';
import 'package:presentation/providers/app_settings_provider.dart';

part 'setting_viewmodel.g.dart';

/// Settings ViewModel (MVI 패턴)
@riverpod
class SettingViewModel extends _$SettingViewModel {
  @override
  SettingState build() {
    // 초기 로드
    Future.microtask(() => onIntent(const SettingIntent.load()));
    return const SettingState.initial();
  }

  /// Intent 처리
  void onIntent(SettingIntent intent) {
    intent.when(
      load: _handleLoad,
      changeCurrency: _handleChangeCurrency,
      changeLanguage: _handleChangeLanguage,
      refreshExchangeRate: _handleRefreshExchangeRate,
    );
  }

  Future<void> _handleLoad() async {
    state = const SettingState.loading();

    try {
      // Get current settings
      final getSettingsUseCase = ref.read(getSettingsUseCaseProvider);
      final currency = await getSettingsUseCase.getCurrency();
      final language = await getSettingsUseCase.getLanguage();

      // Get exchange rate if currency is KRW
      ExchangeRateEntity? exchangeRate;
      if (currency == 'KRW') {
        final getExchangeRateUseCase = ref.read(getExchangeRateUseCaseProvider);
        exchangeRate = await getExchangeRateUseCase.execute('USD', 'KRW');
      }

      // Update global app settings
      ref.read(appSettingsProvider.notifier).updateCurrency(
            currency,
            exchangeRate: exchangeRate,
          );
      ref.read(appSettingsProvider.notifier).updateLanguage(language);

      state = SettingState.loaded(
        currency: currency,
        language: language,
        exchangeRate: exchangeRate,
        lastUpdated: DateTime.now(),
      );
    } catch (e) {
      final appError = e is AppError ? e : GenericNetworkError(e.toString());
      state = SettingState.error(appError);
    }
  }

  Future<void> _handleChangeCurrency(String currency) async {
    try {
      // Save currency
      final saveSettingsUseCase = ref.read(saveSettingsUseCaseProvider);
      await saveSettingsUseCase.setCurrency(currency);

      // Get exchange rate if KRW
      ExchangeRateEntity? exchangeRate;
      if (currency == 'KRW') {
        final getExchangeRateUseCase = ref.read(getExchangeRateUseCaseProvider);
        exchangeRate = await getExchangeRateUseCase.execute('USD', 'KRW');
      }

      // Update global app settings
      ref.read(appSettingsProvider.notifier).updateCurrency(
            currency,
            exchangeRate: exchangeRate,
          );

      state.whenOrNull(
        loaded: (_, language, __, ___) {
          state = SettingState.loaded(
            currency: currency,
            language: language,
            exchangeRate: exchangeRate,
            lastUpdated: DateTime.now(),
          );
        },
      );
    } catch (e) {
      final appError = e is AppError ? e : GenericNetworkError(e.toString());
      state = SettingState.error(appError);
    }
  }

  Future<void> _handleChangeLanguage(String language) async {
    try {
      // Save language
      final saveSettingsUseCase = ref.read(saveSettingsUseCaseProvider);
      await saveSettingsUseCase.setLanguage(language);

      // Update global app settings
      ref.read(appSettingsProvider.notifier).updateLanguage(language);

      state.whenOrNull(
        loaded: (currency, _, exchangeRate, lastUpdated) {
          state = SettingState.loaded(
            currency: currency,
            language: language,
            exchangeRate: exchangeRate,
            lastUpdated: lastUpdated,
          );
        },
      );
    } catch (e) {
      final appError = e is AppError ? e : GenericNetworkError(e.toString());
      state = SettingState.error(appError);
    }
  }

  Future<void> _handleRefreshExchangeRate() async {
    state.whenOrNull(
      loaded: (currency, language, _, __) async {
        if (currency != 'KRW') return;

        try {
          final getExchangeRateUseCase = ref.read(getExchangeRateUseCaseProvider);
          final exchangeRate = await getExchangeRateUseCase.execute('USD', 'KRW');

          // Update global app settings
          ref.read(appSettingsProvider.notifier).updateExchangeRate(exchangeRate);

          state = SettingState.loaded(
            currency: currency,
            language: language,
            exchangeRate: exchangeRate,
            lastUpdated: DateTime.now(),
          );
        } catch (e) {
          final appError = e is AppError ? e : GenericNetworkError(e.toString());
          state = SettingState.error(appError);
        }
      },
    );
  }
}
