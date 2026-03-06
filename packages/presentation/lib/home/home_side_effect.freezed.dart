// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_side_effect.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeSideEffect {
  String get message;

  /// Create a copy of HomeSideEffect
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $HomeSideEffectCopyWith<HomeSideEffect> get copyWith =>
      _$HomeSideEffectCopyWithImpl<HomeSideEffect>(
          this as HomeSideEffect, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is HomeSideEffect &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeSideEffect(message: $message)';
  }
}

/// @nodoc
abstract mixin class $HomeSideEffectCopyWith<$Res> {
  factory $HomeSideEffectCopyWith(
          HomeSideEffect value, $Res Function(HomeSideEffect) _then) =
      _$HomeSideEffectCopyWithImpl;
  @useResult
  $Res call({String message});
}

/// @nodoc
class _$HomeSideEffectCopyWithImpl<$Res>
    implements $HomeSideEffectCopyWith<$Res> {
  _$HomeSideEffectCopyWithImpl(this._self, this._then);

  final HomeSideEffect _self;
  final $Res Function(HomeSideEffect) _then;

  /// Create a copy of HomeSideEffect
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// Adds pattern-matching-related methods to [HomeSideEffect].
extension HomeSideEffectPatterns on HomeSideEffect {
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
    TResult Function(_ShowError value)? showError,
    TResult Function(_ShowToast value)? showToast,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShowError() when showError != null:
        return showError(_that);
      case _ShowToast() when showToast != null:
        return showToast(_that);
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
    required TResult Function(_ShowError value) showError,
    required TResult Function(_ShowToast value) showToast,
  }) {
    final _that = this;
    switch (_that) {
      case _ShowError():
        return showError(_that);
      case _ShowToast():
        return showToast(_that);
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
    TResult? Function(_ShowError value)? showError,
    TResult? Function(_ShowToast value)? showToast,
  }) {
    final _that = this;
    switch (_that) {
      case _ShowError() when showError != null:
        return showError(_that);
      case _ShowToast() when showToast != null:
        return showToast(_that);
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
    TResult Function(String message)? showError,
    TResult Function(String message)? showToast,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ShowError() when showError != null:
        return showError(_that.message);
      case _ShowToast() when showToast != null:
        return showToast(_that.message);
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
    required TResult Function(String message) showError,
    required TResult Function(String message) showToast,
  }) {
    final _that = this;
    switch (_that) {
      case _ShowError():
        return showError(_that.message);
      case _ShowToast():
        return showToast(_that.message);
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
    TResult? Function(String message)? showError,
    TResult? Function(String message)? showToast,
  }) {
    final _that = this;
    switch (_that) {
      case _ShowError() when showError != null:
        return showError(_that.message);
      case _ShowToast() when showToast != null:
        return showToast(_that.message);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ShowError implements HomeSideEffect {
  const _ShowError(this.message);

  @override
  final String message;

  /// Create a copy of HomeSideEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShowErrorCopyWith<_ShowError> get copyWith =>
      __$ShowErrorCopyWithImpl<_ShowError>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShowError &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeSideEffect.showError(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ShowErrorCopyWith<$Res>
    implements $HomeSideEffectCopyWith<$Res> {
  factory _$ShowErrorCopyWith(
          _ShowError value, $Res Function(_ShowError) _then) =
      __$ShowErrorCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ShowErrorCopyWithImpl<$Res> implements _$ShowErrorCopyWith<$Res> {
  __$ShowErrorCopyWithImpl(this._self, this._then);

  final _ShowError _self;
  final $Res Function(_ShowError) _then;

  /// Create a copy of HomeSideEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_ShowError(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _ShowToast implements HomeSideEffect {
  const _ShowToast(this.message);

  @override
  final String message;

  /// Create a copy of HomeSideEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ShowToastCopyWith<_ShowToast> get copyWith =>
      __$ShowToastCopyWithImpl<_ShowToast>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ShowToast &&
            (identical(other.message, message) || other.message == message));
  }

  @override
  int get hashCode => Object.hash(runtimeType, message);

  @override
  String toString() {
    return 'HomeSideEffect.showToast(message: $message)';
  }
}

/// @nodoc
abstract mixin class _$ShowToastCopyWith<$Res>
    implements $HomeSideEffectCopyWith<$Res> {
  factory _$ShowToastCopyWith(
          _ShowToast value, $Res Function(_ShowToast) _then) =
      __$ShowToastCopyWithImpl;
  @override
  @useResult
  $Res call({String message});
}

/// @nodoc
class __$ShowToastCopyWithImpl<$Res> implements _$ShowToastCopyWith<$Res> {
  __$ShowToastCopyWithImpl(this._self, this._then);

  final _ShowToast _self;
  final $Res Function(_ShowToast) _then;

  /// Create a copy of HomeSideEffect
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
  }) {
    return _then(_ShowToast(
      null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
