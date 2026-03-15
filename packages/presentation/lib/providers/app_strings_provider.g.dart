// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_strings_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint, type=warning

@ProviderFor(appStrings)
const appStringsProvider = AppStringsProvider._();

final class AppStringsProvider
    extends $FunctionalProvider<AppStrings, AppStrings, AppStrings>
    with $Provider<AppStrings> {
  const AppStringsProvider._()
      : super(
          from: null,
          argument: null,
          retry: null,
          name: r'appStringsProvider',
          isAutoDispose: true,
          dependencies: null,
          $allTransitiveDependencies: null,
        );

  @override
  String debugGetCreateSourceHash() => _$appStringsHash();

  @$internal
  @override
  $ProviderElement<AppStrings> $createElement($ProviderPointer pointer) =>
      $ProviderElement(pointer);

  @override
  AppStrings create(Ref ref) {
    return appStrings(ref);
  }

  /// {@macro riverpod.override_with_value}
  Override overrideWithValue(AppStrings value) {
    return $ProviderOverride(
      origin: this,
      providerOverride: $SyncValueProvider<AppStrings>(value),
    );
  }
}

String _$appStringsHash() => r'4bdea031bc431ebb628048d2d6765fcdd1cfa230';
