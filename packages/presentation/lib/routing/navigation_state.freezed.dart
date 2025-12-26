// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'navigation_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NavigationState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is NavigationState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationState()';
  }
}

/// @nodoc
class $NavigationStateCopyWith<$Res> {
  $NavigationStateCopyWith(
      NavigationState _, $Res Function(NavigationState) __);
}

/// Adds pattern-matching-related methods to [NavigationState].
extension NavigationStatePatterns on NavigationState {
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
    TResult Function(_Idle value)? idle,
    TResult Function(_NavigateTo value)? navigateTo,
    TResult Function(_PushTo value)? pushTo,
    TResult Function(_GoBack value)? goBack,
    TResult Function(_NavigateToTab value)? navigateToTab,
    TResult Function(_ReplaceAll value)? replaceAll,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _NavigateTo() when navigateTo != null:
        return navigateTo(_that);
      case _PushTo() when pushTo != null:
        return pushTo(_that);
      case _GoBack() when goBack != null:
        return goBack(_that);
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that);
      case _ReplaceAll() when replaceAll != null:
        return replaceAll(_that);
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
    required TResult Function(_Idle value) idle,
    required TResult Function(_NavigateTo value) navigateTo,
    required TResult Function(_PushTo value) pushTo,
    required TResult Function(_GoBack value) goBack,
    required TResult Function(_NavigateToTab value) navigateToTab,
    required TResult Function(_ReplaceAll value) replaceAll,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle(_that);
      case _NavigateTo():
        return navigateTo(_that);
      case _PushTo():
        return pushTo(_that);
      case _GoBack():
        return goBack(_that);
      case _NavigateToTab():
        return navigateToTab(_that);
      case _ReplaceAll():
        return replaceAll(_that);
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
    TResult? Function(_Idle value)? idle,
    TResult? Function(_NavigateTo value)? navigateTo,
    TResult? Function(_PushTo value)? pushTo,
    TResult? Function(_GoBack value)? goBack,
    TResult? Function(_NavigateToTab value)? navigateToTab,
    TResult? Function(_ReplaceAll value)? replaceAll,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle(_that);
      case _NavigateTo() when navigateTo != null:
        return navigateTo(_that);
      case _PushTo() when pushTo != null:
        return pushTo(_that);
      case _GoBack() when goBack != null:
        return goBack(_that);
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that);
      case _ReplaceAll() when replaceAll != null:
        return replaceAll(_that);
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
    TResult Function()? idle,
    TResult Function(PageType pageType, Map<String, String> pathParams,
            Map<String, String> queryParams, Object? extra)?
        navigateTo,
    TResult Function(PageType pageType, Map<String, String> pathParams,
            Map<String, String> queryParams, Object? extra)?
        pushTo,
    TResult Function()? goBack,
    TResult Function(int tabIndex)? navigateToTab,
    TResult Function(PageType pageType)? replaceAll,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle();
      case _NavigateTo() when navigateTo != null:
        return navigateTo(
            _that.pageType, _that.pathParams, _that.queryParams, _that.extra);
      case _PushTo() when pushTo != null:
        return pushTo(
            _that.pageType, _that.pathParams, _that.queryParams, _that.extra);
      case _GoBack() when goBack != null:
        return goBack();
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that.tabIndex);
      case _ReplaceAll() when replaceAll != null:
        return replaceAll(_that.pageType);
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
    required TResult Function() idle,
    required TResult Function(PageType pageType, Map<String, String> pathParams,
            Map<String, String> queryParams, Object? extra)
        navigateTo,
    required TResult Function(PageType pageType, Map<String, String> pathParams,
            Map<String, String> queryParams, Object? extra)
        pushTo,
    required TResult Function() goBack,
    required TResult Function(int tabIndex) navigateToTab,
    required TResult Function(PageType pageType) replaceAll,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle():
        return idle();
      case _NavigateTo():
        return navigateTo(
            _that.pageType, _that.pathParams, _that.queryParams, _that.extra);
      case _PushTo():
        return pushTo(
            _that.pageType, _that.pathParams, _that.queryParams, _that.extra);
      case _GoBack():
        return goBack();
      case _NavigateToTab():
        return navigateToTab(_that.tabIndex);
      case _ReplaceAll():
        return replaceAll(_that.pageType);
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
    TResult? Function()? idle,
    TResult? Function(PageType pageType, Map<String, String> pathParams,
            Map<String, String> queryParams, Object? extra)?
        navigateTo,
    TResult? Function(PageType pageType, Map<String, String> pathParams,
            Map<String, String> queryParams, Object? extra)?
        pushTo,
    TResult? Function()? goBack,
    TResult? Function(int tabIndex)? navigateToTab,
    TResult? Function(PageType pageType)? replaceAll,
  }) {
    final _that = this;
    switch (_that) {
      case _Idle() when idle != null:
        return idle();
      case _NavigateTo() when navigateTo != null:
        return navigateTo(
            _that.pageType, _that.pathParams, _that.queryParams, _that.extra);
      case _PushTo() when pushTo != null:
        return pushTo(
            _that.pageType, _that.pathParams, _that.queryParams, _that.extra);
      case _GoBack() when goBack != null:
        return goBack();
      case _NavigateToTab() when navigateToTab != null:
        return navigateToTab(_that.tabIndex);
      case _ReplaceAll() when replaceAll != null:
        return replaceAll(_that.pageType);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Idle implements NavigationState {
  const _Idle();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Idle);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationState.idle()';
  }
}

/// @nodoc

class _NavigateTo implements NavigationState {
  const _NavigateTo(
      {required this.pageType,
      final Map<String, String> pathParams = const {},
      final Map<String, String> queryParams = const {},
      this.extra})
      : _pathParams = pathParams,
        _queryParams = queryParams;

  final PageType pageType;
  final Map<String, String> _pathParams;
  @JsonKey()
  Map<String, String> get pathParams {
    if (_pathParams is EqualUnmodifiableMapView) return _pathParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pathParams);
  }

  final Map<String, String> _queryParams;
  @JsonKey()
  Map<String, String> get queryParams {
    if (_queryParams is EqualUnmodifiableMapView) return _queryParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_queryParams);
  }

  final Object? extra;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToCopyWith<_NavigateTo> get copyWith =>
      __$NavigateToCopyWithImpl<_NavigateTo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateTo &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType) &&
            const DeepCollectionEquality()
                .equals(other._pathParams, _pathParams) &&
            const DeepCollectionEquality()
                .equals(other._queryParams, _queryParams) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageType,
      const DeepCollectionEquality().hash(_pathParams),
      const DeepCollectionEquality().hash(_queryParams),
      const DeepCollectionEquality().hash(extra));

  @override
  String toString() {
    return 'NavigationState.navigateTo(pageType: $pageType, pathParams: $pathParams, queryParams: $queryParams, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigateToCopyWith(
          _NavigateTo value, $Res Function(_NavigateTo) _then) =
      __$NavigateToCopyWithImpl;
  @useResult
  $Res call(
      {PageType pageType,
      Map<String, String> pathParams,
      Map<String, String> queryParams,
      Object? extra});
}

/// @nodoc
class __$NavigateToCopyWithImpl<$Res> implements _$NavigateToCopyWith<$Res> {
  __$NavigateToCopyWithImpl(this._self, this._then);

  final _NavigateTo _self;
  final $Res Function(_NavigateTo) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageType = null,
    Object? pathParams = null,
    Object? queryParams = null,
    Object? extra = freezed,
  }) {
    return _then(_NavigateTo(
      pageType: null == pageType
          ? _self.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as PageType,
      pathParams: null == pathParams
          ? _self._pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      queryParams: null == queryParams
          ? _self._queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      extra: freezed == extra ? _self.extra : extra,
    ));
  }
}

/// @nodoc

class _PushTo implements NavigationState {
  const _PushTo(
      {required this.pageType,
      final Map<String, String> pathParams = const {},
      final Map<String, String> queryParams = const {},
      this.extra})
      : _pathParams = pathParams,
        _queryParams = queryParams;

  final PageType pageType;
  final Map<String, String> _pathParams;
  @JsonKey()
  Map<String, String> get pathParams {
    if (_pathParams is EqualUnmodifiableMapView) return _pathParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_pathParams);
  }

  final Map<String, String> _queryParams;
  @JsonKey()
  Map<String, String> get queryParams {
    if (_queryParams is EqualUnmodifiableMapView) return _queryParams;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_queryParams);
  }

  final Object? extra;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PushToCopyWith<_PushTo> get copyWith =>
      __$PushToCopyWithImpl<_PushTo>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PushTo &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType) &&
            const DeepCollectionEquality()
                .equals(other._pathParams, _pathParams) &&
            const DeepCollectionEquality()
                .equals(other._queryParams, _queryParams) &&
            const DeepCollectionEquality().equals(other.extra, extra));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      pageType,
      const DeepCollectionEquality().hash(_pathParams),
      const DeepCollectionEquality().hash(_queryParams),
      const DeepCollectionEquality().hash(extra));

  @override
  String toString() {
    return 'NavigationState.pushTo(pageType: $pageType, pathParams: $pathParams, queryParams: $queryParams, extra: $extra)';
  }
}

/// @nodoc
abstract mixin class _$PushToCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$PushToCopyWith(_PushTo value, $Res Function(_PushTo) _then) =
      __$PushToCopyWithImpl;
  @useResult
  $Res call(
      {PageType pageType,
      Map<String, String> pathParams,
      Map<String, String> queryParams,
      Object? extra});
}

/// @nodoc
class __$PushToCopyWithImpl<$Res> implements _$PushToCopyWith<$Res> {
  __$PushToCopyWithImpl(this._self, this._then);

  final _PushTo _self;
  final $Res Function(_PushTo) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageType = null,
    Object? pathParams = null,
    Object? queryParams = null,
    Object? extra = freezed,
  }) {
    return _then(_PushTo(
      pageType: null == pageType
          ? _self.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as PageType,
      pathParams: null == pathParams
          ? _self._pathParams
          : pathParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      queryParams: null == queryParams
          ? _self._queryParams
          : queryParams // ignore: cast_nullable_to_non_nullable
              as Map<String, String>,
      extra: freezed == extra ? _self.extra : extra,
    ));
  }
}

/// @nodoc

class _GoBack implements NavigationState {
  const _GoBack();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _GoBack);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'NavigationState.goBack()';
  }
}

/// @nodoc

class _NavigateToTab implements NavigationState {
  const _NavigateToTab({required this.tabIndex});

  final int tabIndex;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NavigateToTabCopyWith<_NavigateToTab> get copyWith =>
      __$NavigateToTabCopyWithImpl<_NavigateToTab>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NavigateToTab &&
            (identical(other.tabIndex, tabIndex) ||
                other.tabIndex == tabIndex));
  }

  @override
  int get hashCode => Object.hash(runtimeType, tabIndex);

  @override
  String toString() {
    return 'NavigationState.navigateToTab(tabIndex: $tabIndex)';
  }
}

/// @nodoc
abstract mixin class _$NavigateToTabCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$NavigateToTabCopyWith(
          _NavigateToTab value, $Res Function(_NavigateToTab) _then) =
      __$NavigateToTabCopyWithImpl;
  @useResult
  $Res call({int tabIndex});
}

/// @nodoc
class __$NavigateToTabCopyWithImpl<$Res>
    implements _$NavigateToTabCopyWith<$Res> {
  __$NavigateToTabCopyWithImpl(this._self, this._then);

  final _NavigateToTab _self;
  final $Res Function(_NavigateToTab) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tabIndex = null,
  }) {
    return _then(_NavigateToTab(
      tabIndex: null == tabIndex
          ? _self.tabIndex
          : tabIndex // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _ReplaceAll implements NavigationState {
  const _ReplaceAll({required this.pageType});

  final PageType pageType;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReplaceAllCopyWith<_ReplaceAll> get copyWith =>
      __$ReplaceAllCopyWithImpl<_ReplaceAll>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReplaceAll &&
            (identical(other.pageType, pageType) ||
                other.pageType == pageType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, pageType);

  @override
  String toString() {
    return 'NavigationState.replaceAll(pageType: $pageType)';
  }
}

/// @nodoc
abstract mixin class _$ReplaceAllCopyWith<$Res>
    implements $NavigationStateCopyWith<$Res> {
  factory _$ReplaceAllCopyWith(
          _ReplaceAll value, $Res Function(_ReplaceAll) _then) =
      __$ReplaceAllCopyWithImpl;
  @useResult
  $Res call({PageType pageType});
}

/// @nodoc
class __$ReplaceAllCopyWithImpl<$Res> implements _$ReplaceAllCopyWith<$Res> {
  __$ReplaceAllCopyWithImpl(this._self, this._then);

  final _ReplaceAll _self;
  final $Res Function(_ReplaceAll) _then;

  /// Create a copy of NavigationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? pageType = null,
  }) {
    return _then(_ReplaceAll(
      pageType: null == pageType
          ? _self.pageType
          : pageType // ignore: cast_nullable_to_non_nullable
              as PageType,
    ));
  }
}

// dart format on
