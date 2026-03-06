// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Home ViewModel with SideEffect + WebSocket subscription support

@ProviderFor(HomeViewModel)
const homeViewModelProvider = HomeViewModelProvider._();

/// Home ViewModel with SideEffect + WebSocket subscription support
final class HomeViewModelProvider
    extends $NotifierProvider<HomeViewModel, HomeState> {
  /// Home ViewModel with SideEffect + WebSocket subscription support
  const HomeViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'homeViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$homeViewModelHash();

  @$internal
  @override
  HomeViewModel create() => HomeViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(HomeState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<HomeState>(value),
    );
  }
}

String _$homeViewModelHash() => r'5b2edc812b37ba4c94417a0b8419045261627ba1';

/// Home ViewModel with SideEffect + WebSocket subscription support

abstract class _$HomeViewModel extends $Notifier<HomeState> {
  HomeState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<HomeState, HomeState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<HomeState, HomeState>, HomeState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
