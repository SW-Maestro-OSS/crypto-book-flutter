// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin_detail_notifier.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(CoinDetailNotifier)
const coinDetailProvider = CoinDetailNotifierFamily._();

final class CoinDetailNotifierProvider
    extends $NotifierProvider<CoinDetailNotifier, CoinDetailState> {
  const CoinDetailNotifierProvider._(
      {required CoinDetailNotifierFamily super.from,
      required String super.argument})
      : super(
          retry: null,
          name: r'coinDetailProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$coinDetailNotifierHash();

  @override
  String toString() {
    return r'coinDetailProvider'
        ''
        '($argument)';
  }

  @$internal
  @override
  CoinDetailNotifier create() => CoinDetailNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(CoinDetailState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<CoinDetailState>(value),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is CoinDetailNotifierProvider && other.argument == argument;
  }

  @override
  int get hashCode {
    return argument.hashCode;
  }
}

String _$coinDetailNotifierHash() =>
    r'bda2a993cd4440f138fc7cbf1d1b41ea3824a48c';

final class CoinDetailNotifierFamily extends $Family
    with
        $ClassFamilyOverride<CoinDetailNotifier, CoinDetailState,
            CoinDetailState, CoinDetailState, String> {
  const CoinDetailNotifierFamily._()
      : super(
          retry: null,
          name: r'coinDetailProvider',
          dependencies: null,
          $allTransitiveDependencies: null,
          isAutoDispose: true,
        );

  CoinDetailNotifierProvider call(
    String symbol,
  ) =>
      CoinDetailNotifierProvider._(argument: symbol, from: this);

  @override
  String toString() => r'coinDetailProvider';
}

abstract class _$CoinDetailNotifier extends $Notifier<CoinDetailState> {
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
