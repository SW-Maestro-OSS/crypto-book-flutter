// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Home 화면의 ViewModel (비즈니스 로직)

@ProviderFor(HomeViewModel)
const homeViewModelProvider = HomeViewModelProvider._();

/// Home 화면의 ViewModel (비즈니스 로직)
final class HomeViewModelProvider
    extends $NotifierProvider<HomeViewModel, HomeState> {
  /// Home 화면의 ViewModel (비즈니스 로직)
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

String _$homeViewModelHash() => r'f89cfbc9d1d31b2de03ac40b69a224ba89a62b62';

/// Home 화면의 ViewModel (비즈니스 로직)

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
