// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'usecase_providers.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// GetCoinListUseCase Provider
/// 실제 구현체는 root app에서 override됨

@ProviderFor(getCoinListUseCase)
const getCoinListUseCaseProvider = GetCoinListUseCaseProvider._();

/// GetCoinListUseCase Provider
/// 실제 구현체는 root app에서 override됨

final class GetCoinListUseCaseProvider extends $FunctionalProvider<
    GetCoinListUseCase,
    GetCoinListUseCase,
    GetCoinListUseCase> with $Provider<GetCoinListUseCase> {
  /// GetCoinListUseCase Provider
  /// 실제 구현체는 root app에서 override됨
  const GetCoinListUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'getCoinListUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$getCoinListUseCaseHash();

  @$internal
  @override
  $ProviderElement<GetCoinListUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  GetCoinListUseCase create(Ref ref) {
    return getCoinListUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(GetCoinListUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<GetCoinListUseCase>(value),
    );
  }
}

String _$getCoinListUseCaseHash() =>
    r'df7ad9fa896c93cada6efeeb070b08dc948e37d0';

/// SubscribeCoinTickerUseCase Provider
/// 실제 구현체는 root app에서 override됨

@ProviderFor(subscribeCoinTickerUseCase)
const subscribeCoinTickerUseCaseProvider =
    SubscribeCoinTickerUseCaseProvider._();

/// SubscribeCoinTickerUseCase Provider
/// 실제 구현체는 root app에서 override됨

final class SubscribeCoinTickerUseCaseProvider extends $FunctionalProvider<
    SubscribeCoinTickerUseCase,
    SubscribeCoinTickerUseCase,
    SubscribeCoinTickerUseCase> with $Provider<SubscribeCoinTickerUseCase> {
  /// SubscribeCoinTickerUseCase Provider
  /// 실제 구현체는 root app에서 override됨
  const SubscribeCoinTickerUseCaseProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'subscribeCoinTickerUseCaseProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$subscribeCoinTickerUseCaseHash();

  @$internal
  @override
  $ProviderElement<SubscribeCoinTickerUseCase> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  SubscribeCoinTickerUseCase create(Ref ref) {
    return subscribeCoinTickerUseCase(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SubscribeCoinTickerUseCase value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SubscribeCoinTickerUseCase>(value),
    );
  }
}

String _$subscribeCoinTickerUseCaseHash() =>
    r'3583fe7bc3ca2ab28ad21d4b9e2cfc9a3f53f0b9';
