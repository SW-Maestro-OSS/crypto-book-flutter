// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'main_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MainIntent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is MainIntent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainIntent()';
  }
}

/// @nodoc
class $MainIntentCopyWith<$Res> {
  $MainIntentCopyWith(MainIntent _, $Res Function(MainIntent) __);
}

/// Adds pattern-matching-related methods to [MainIntent].
extension MainIntentPatterns on MainIntent {
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
    TResult Function(_ChangeTab value)? changeTab,
    TResult Function(_NavigationCompleted value)? navigationCompleted,
    TResult Function(_HandleDeepLink value)? handleDeepLink,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeTab() when changeTab != null:
        return changeTab(_that);
      case _NavigationCompleted() when navigationCompleted != null:
        return navigationCompleted(_that);
      case _HandleDeepLink() when handleDeepLink != null:
        return handleDeepLink(_that);
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
    required TResult Function(_ChangeTab value) changeTab,
    required TResult Function(_NavigationCompleted value) navigationCompleted,
    required TResult Function(_HandleDeepLink value) handleDeepLink,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeTab():
        return changeTab(_that);
      case _NavigationCompleted():
        return navigationCompleted(_that);
      case _HandleDeepLink():
        return handleDeepLink(_that);
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
    TResult? Function(_ChangeTab value)? changeTab,
    TResult? Function(_NavigationCompleted value)? navigationCompleted,
    TResult? Function(_HandleDeepLink value)? handleDeepLink,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeTab() when changeTab != null:
        return changeTab(_that);
      case _NavigationCompleted() when navigationCompleted != null:
        return navigationCompleted(_that);
      case _HandleDeepLink() when handleDeepLink != null:
        return handleDeepLink(_that);
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
    TResult Function(int tabIndex)? changeTab,
    TResult Function()? navigationCompleted,
    TResult Function(String path)? handleDeepLink,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeTab() when changeTab != null:
        return changeTab(_that.tabIndex);
      case _NavigationCompleted() when navigationCompleted != null:
        return navigationCompleted();
      case _HandleDeepLink() when handleDeepLink != null:
        return handleDeepLink(_that.path);
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
    required TResult Function(int tabIndex) changeTab,
    required TResult Function() navigationCompleted,
    required TResult Function(String path) handleDeepLink,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeTab():
        return changeTab(_that.tabIndex);
      case _NavigationCompleted():
        return navigationCompleted();
      case _HandleDeepLink():
        return handleDeepLink(_that.path);
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
    TResult? Function(int tabIndex)? changeTab,
    TResult? Function()? navigationCompleted,
    TResult? Function(String path)? handleDeepLink,
  }) {
    final _that = this;
    switch (_that) {
      case _ChangeTab() when changeTab != null:
        return changeTab(_that.tabIndex);
      case _NavigationCompleted() when navigationCompleted != null:
        return navigationCompleted();
      case _HandleDeepLink() when handleDeepLink != null:
        return handleDeepLink(_that.path);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _ChangeTab implements MainIntent {
  const _ChangeTab(this.tabIndex);

  final int tabIndex;

  /// Create a copy of MainIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeTabCopyWith<_ChangeTab> get copyWith =>
      __$ChangeTabCopyWithImpl<_ChangeTab>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeTab &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @override
  String toString() {
    return 'MainIntent.changeTab(tabIndex: $tabIndex)';
  }
}

/// @nodoc
abstract mixin class _$ChangeTabCopyWith<$Res>
    implements $MainIntentCopyWith<$Res> {
  factory _$ChangeTabCopyWith(
          _ChangeTab value, $Res Function(_ChangeTab) _then) =
      __$ChangeTabCopyWithImpl;
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$ChangeTabCopyWithImpl<$Res> implements _$ChangeTabCopyWith<$Res> {
  __$ChangeTabCopyWithImpl(this._self, this._then);

  final _ChangeTab _self;
  final $Res Function(_ChangeTab) _then;

  /// Create a copy of MainIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_ChangeTab(
      null == tabIndex
          ? _self.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _NavigationCompleted implements MainIntent {
  const _NavigationCompleted();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _NavigationCompleted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'MainIntent.navigationCompleted()';
  }
}

/// @nodoc

class _HandleDeepLink implements MainIntent {
  const _HandleDeepLink(this.path);

  final String path;

  /// Create a copy of MainIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$HandleDeepLinkCopyWith<_HandleDeepLink> get copyWith =>
      __$HandleDeepLinkCopyWithImpl<_HandleDeepLink>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _HandleDeepLink &&
            (identical(other.path, path) || other.path == path));
  }

  @override
  int get hashCode => Object.hash(runtimeType, path);

  @override
  String toString() {
    return 'MainIntent.handleDeepLink(path: $path)';
  }
}

/// @nodoc
abstract mixin class _$HandleDeepLinkCopyWith<$Res>
    implements $MainIntentCopyWith<$Res> {
  factory _$HandleDeepLinkCopyWith(
          _HandleDeepLink value, $Res Function(_HandleDeepLink) _then) =
      __$HandleDeepLinkCopyWithImpl;
  @useResult
  $Res call({String path});
}

/// @nodoc
class __$HandleDeepLinkCopyWithImpl<$Res>
    implements _$HandleDeepLinkCopyWith<$Res> {
  __$HandleDeepLinkCopyWithImpl(this._self, this._then);

  final _HandleDeepLink _self;
  final $Res Function(_HandleDeepLink) _then;

  /// Create a copy of MainIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? path = null,
  }) {
    return _then(_HandleDeepLink(
      null == path
          ? _self.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
