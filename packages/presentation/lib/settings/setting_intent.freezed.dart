// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'setting_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SettingIntent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SettingIntent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingIntent()';
  }
}

/// @nodoc
class $SettingIntentCopyWith<$Res> {
  $SettingIntentCopyWith(SettingIntent _, $Res Function(SettingIntent) __);
}

/// Adds pattern-matching-related methods to [SettingIntent].
extension SettingIntentPatterns on SettingIntent {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Load value)? load,
    TResult Function(_ChangeCurrency value)? changeCurrency,
    TResult Function(_ChangeLanguage value)? changeLanguage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _ChangeCurrency() when changeCurrency != null:
        return changeCurrency(_that);
      case _ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Load value) load,
    required TResult Function(_ChangeCurrency value) changeCurrency,
    required TResult Function(_ChangeLanguage value) changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that);
      case _ChangeCurrency():
        return changeCurrency(_that);
      case _ChangeLanguage():
        return changeLanguage(_that);
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Load value)? load,
    TResult? Function(_ChangeCurrency value)? changeCurrency,
    TResult? Function(_ChangeLanguage value)? changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _ChangeCurrency() when changeCurrency != null:
        return changeCurrency(_that);
      case _ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? load,
    TResult Function(String currency)? changeCurrency,
    TResult Function(String language)? changeLanguage,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load();
      case _ChangeCurrency() when changeCurrency != null:
        return changeCurrency(_that.currency);
      case _ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that.language);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() load,
    required TResult Function(String currency) changeCurrency,
    required TResult Function(String language) changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load();
      case _ChangeCurrency():
        return changeCurrency(_that.currency);
      case _ChangeLanguage():
        return changeLanguage(_that.language);
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? load,
    TResult? Function(String currency)? changeCurrency,
    TResult? Function(String language)? changeLanguage,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load();
      case _ChangeCurrency() when changeCurrency != null:
        return changeCurrency(_that.currency);
      case _ChangeLanguage() when changeLanguage != null:
        return changeLanguage(_that.language);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Load implements SettingIntent {
  const _Load();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Load);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SettingIntent.load()';
  }
}

/// @nodoc

class _ChangeCurrency implements SettingIntent {
  const _ChangeCurrency(this.currency);

  final String currency;

  /// Create a copy of SettingIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeCurrencyCopyWith<_ChangeCurrency> get copyWith =>
      __$ChangeCurrencyCopyWithImpl<_ChangeCurrency>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeCurrency &&
            (identical(other.currency, currency) ||
                other.currency == currency));
  }

  @override
  int get hashCode => Object.hash(runtimeType, currency);

  @override
  String toString() {
    return 'SettingIntent.changeCurrency(currency: $currency)';
  }
}

/// @nodoc
abstract mixin class _$ChangeCurrencyCopyWith<$Res>
    implements $SettingIntentCopyWith<$Res> {
  factory _$ChangeCurrencyCopyWith(
          _ChangeCurrency value, $Res Function(_ChangeCurrency) _then) =
      __$ChangeCurrencyCopyWithImpl;
  @useResult
  $Res call({String currency});
}

/// @nodoc
class __$ChangeCurrencyCopyWithImpl<$Res>
    implements _$ChangeCurrencyCopyWith<$Res> {
  __$ChangeCurrencyCopyWithImpl(this._self, this._then);

  final _ChangeCurrency _self;
  final $Res Function(_ChangeCurrency) _then;

  /// Create a copy of SettingIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? currency = null,
  }) {
    return _then(_ChangeCurrency(
      null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ChangeLanguage implements SettingIntent {
  const _ChangeLanguage(this.language);

  final String language;

  /// Create a copy of SettingIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeLanguageCopyWith<_ChangeLanguage> get copyWith =>
      __$ChangeLanguageCopyWithImpl<_ChangeLanguage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeLanguage &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'SettingIntent.changeLanguage(language: $language)';
  }
}

/// @nodoc
abstract mixin class _$ChangeLanguageCopyWith<$Res>
    implements $SettingIntentCopyWith<$Res> {
  factory _$ChangeLanguageCopyWith(
          _ChangeLanguage value, $Res Function(_ChangeLanguage) _then) =
      __$ChangeLanguageCopyWithImpl;
  @useResult
  $Res call({String language});
}

/// @nodoc
class __$ChangeLanguageCopyWithImpl<$Res>
    implements _$ChangeLanguageCopyWith<$Res> {
  __$ChangeLanguageCopyWithImpl(this._self, this._then);

  final _ChangeLanguage _self;
  final $Res Function(_ChangeLanguage) _then;

  /// Create a copy of SettingIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(_ChangeLanguage(
      null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
