// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'theme_mode_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(ThemeModeNotifier)
const themeModeProvider = ThemeModeNotifierProvider._();

final class ThemeModeNotifierProvider
    extends $NotifierProvider<ThemeModeNotifier, flutter.ThemeMode> {
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
  Override overrideWithValue(flutter.ThemeMode value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<flutter.ThemeMode>(value),
    );
  }
}

String _$themeModeNotifierHash() => r'da04a8495c55533b9a2175177b0bb31656101d7d';

abstract class _$ThemeModeNotifier extends $Notifier<flutter.ThemeMode> {
  flutter.ThemeMode build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<flutter.ThemeMode, flutter.ThemeMode>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<flutter.ThemeMode, flutter.ThemeMode>,
        flutter.ThemeMode,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
