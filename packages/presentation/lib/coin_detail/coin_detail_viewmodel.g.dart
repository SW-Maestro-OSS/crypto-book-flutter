// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detail_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Coin Detail 화면의 ViewModel (비즈니스 로직)

@ProviderFor(CoinDetailViewModel)
const coinDetailViewModelProvider = CoinDetailViewModelFamily._();

/// Coin Detail 화면의 ViewModel (비즈니스 로직)
final class CoinDetailViewModelProvider
    extends $NotifierProvider<CoinDetailViewModel, CoinDetailState> {
  /// Coin Detail 화면의 ViewModel (비즈니스 로직)
  const CoinDetailViewModelProvider._(
      {required CoinDetailViewModelFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'coinDetailViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$coinDetailViewModelHash();

  @override
  String toString() {
    return r'coinDetailViewModelProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CoinDetailViewModel create() => CoinDetailViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoinDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoinDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CoinDetailViewModelProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coinDetailViewModelHash() =>
    r'de1c5876284f87c9aa3f3761bdf5d22de81bfad7';

/// Coin Detail 화면의 ViewModel (비즈니스 로직)

final class CoinDetailViewModelFamily extends $Family
    with
        $ClassFamilyOverride<CoinDetailViewModel, CoinDetailState,
            CoinDetailState, CoinDetailState, String> {
  const CoinDetailViewModelFamily._()
      : super(
          retry: null,
          name: r'coinDetailViewModelProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  /// Coin Detail 화면의 ViewModel (비즈니스 로직)

  CoinDetailViewModelProvider call(
    String symbol,
  ) =>
      CoinDetailViewModelProvider._(argument: symbol, from: this);

  @override
  String toString() => r'coinDetailViewModelProvider';
}

/// Coin Detail 화면의 ViewModel (비즈니스 로직)

abstract class _$CoinDetailViewModel extends $Notifier<CoinDetailState> {
  late final _$args = ref.$arg as String;
  String get symbol => _$args;

  CoinDetailState build(
    String symbol,
  );
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build(
      _$args,
    );
    final ref = this.ref as $Ref<CoinDetailState, CoinDetailState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<CoinDetailState, CoinDetailState>,
        CoinDetailState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
