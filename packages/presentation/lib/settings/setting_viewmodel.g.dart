// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setting_viewmodel.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning
/// Settings ViewModel (MVI 패턴)

@ProviderFor(SettingViewModel)
const settingViewModelProvider = SettingViewModelProvider._();

/// Settings ViewModel (MVI 패턴)
final class SettingViewModelProvider
    extends $NotifierProvider<SettingViewModel, SettingState> {
  /// Settings ViewModel (MVI 패턴)
  const SettingViewModelProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'settingViewModelProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$settingViewModelHash();

  @$internal
  @override
  SettingViewModel create() => SettingViewModel();

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(SettingState value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<SettingState>(value),
    );
  }
}

String _$settingViewModelHash() => r'2c55912bb49866e5188501deb847c493752ab490';

/// Settings ViewModel (MVI 패턴)

abstract class _$SettingViewModel extends $Notifier<SettingState> {
  SettingState build();
  @$mustCallSuper
  @override
  void runBuild() {
    final created = build();
    final ref = this.ref as $Ref<SettingState, SettingState>;
    final element = ref.element as $ClassProviderElement<
        AnyNotifier<SettingState, SettingState>,
        SettingState,
        Object?,
        Object?>;
    element.handleValue(ref, created);
  }
}
