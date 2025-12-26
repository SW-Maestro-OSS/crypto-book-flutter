// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'splash_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Splash 화면의 ViewModel (비즈니스 로직)

@ProviderFor(SplashViewModel)
const splashViewModelProvider = SplashViewModelProvider._();

/// Splash 화면의 ViewModel (비즈니스 로직)
final class SplashViewModelProvider
    extends $NotifierProvider<SplashViewModel, SplashState> {
  /// Splash 화면의 ViewModel (비즈니스 로직)
  const SplashViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'splashViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$splashViewModelHash();

  @$internal
  @override
  SplashViewModel create() => SplashViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SplashState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SplashState>(value),
    );
  }
}

String _$splashViewModelHash() => r'184671d0ed263ff97f2cddcdc3672597ee8b3b67';

/// Splash 화면의 ViewModel (비즈니스 로직)

abstract class _$SplashViewModel extends $Notifier<SplashState> {
  SplashState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SplashState, SplashState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SplashState, SplashState>, SplashState, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
