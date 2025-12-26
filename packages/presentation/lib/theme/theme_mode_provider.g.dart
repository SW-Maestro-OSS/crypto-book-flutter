// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(themePreferenceService)
const themePreferenceServiceProvider = ThemePreferenceServiceProvider._();

final class ThemePreferenceServiceProvider extends $FunctionalProvider<
    ThemePreferenceService,
    ThemePreferenceService,
    ThemePreferenceService> with $Provider<ThemePreferenceService> {
  const ThemePreferenceServiceProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'themePreferenceServiceProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$themePreferenceServiceHash();

  @$internal
  @override
  $ProviderElement<ThemePreferenceService> $createElement(
          $ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  ThemePreferenceService create(Ref ref) {
    return themePreferenceService(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemePreferenceService value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemePreferenceService>(value),
    );
  }
}

String _$themePreferenceServiceHash() =>
    r'a739f53088795d03089e6945ca607e69908ccc32';

@ProviderFor(ThemeModeNotifier)
const themeModeProvider = ThemeModeNotifierProvider._();

final class ThemeModeNotifierProvider
    extends $NotifierProvider<ThemeModeNotifier, ThemeMode> {
  const ThemeModeNotifierProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'themeModeProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$themeModeNotifierHash();

  @$internal
  @override
  ThemeModeNotifier create() => ThemeModeNotifier();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<ThemeMode>(value),
    );
  }
}

String _$themeModeNotifierHash() => r'209d2eba393e7b7b3d55f17e30ab54f2466ad03d';

abstract class _$ThemeModeNotifier extends $Notifier<ThemeMode> {
  ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<ThemeMode, ThemeMode>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<ThemeMode, ThemeMode>, ThemeMode, Object?, Object?>;
    element.handleValue(ref, created);
  }
}
