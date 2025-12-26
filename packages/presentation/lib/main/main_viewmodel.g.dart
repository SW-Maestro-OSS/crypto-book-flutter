// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'main_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Main screen ViewModel
///
/// This ViewModel manages:
/// - Tab selection state
/// - Navigation state for child ViewModels

@ProviderFor(MainViewModel)
const mainViewModelProvider = MainViewModelProvider._();

/// Main screen ViewModel
///
/// This ViewModel manages:
/// - Tab selection state
/// - Navigation state for child ViewModels
final class MainViewModelProvider
    extends $NotifierProvider<MainViewModel, MainState> {
  /// Main screen ViewModel
  ///
  /// This ViewModel manages:
  /// - Tab selection state
  /// - Navigation state for child ViewModels
  const MainViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'mainViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$mainViewModelHash();

  @$internal
  @override
  MainViewModel create() => MainViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(MainState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<MainState>(value),
    );
  }
}

String _$mainViewModelHash() => r'66a270d81370d37a04eef2c4a9489c9e6bb7fcbd';

/// Main screen ViewModel
///
/// This ViewModel manages:
/// - Tab selection state
/// - Navigation state for child ViewModels

abstract class _$MainViewModel extends $Notifier<MainState> {
  MainState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<MainState, MainState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<MainState, MainState>, MainState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}

/// Provider for RoutingHelper
///
/// This allows other ViewModels to access the RoutingHelper

@ProviderFor(routingHelper)
const routingHelperProvider = RoutingHelperProvider._();

/// Provider for RoutingHelper
///
/// This allows other ViewModels to access the RoutingHelper

final class RoutingHelperProvider
    extends $FunctionalProvider<RoutingHelper, RoutingHelper, RoutingHelper>
    with $Provider<RoutingHelper> {
  /// Provider for RoutingHelper
  ///
  /// This allows other ViewModels to access the RoutingHelper
  const RoutingHelperProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'routingHelperProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$routingHelperHash();

  @$internal
  @override
  $ProviderElement<RoutingHelper> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  RoutingHelper create(Ref ref) {
    return routingHelper(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(RoutingHelper value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<RoutingHelper>(value),
    );
  }
}

String _$routingHelperHash() => r'ff031f2221adc99ef1048b7dcebc27e26b716206';
