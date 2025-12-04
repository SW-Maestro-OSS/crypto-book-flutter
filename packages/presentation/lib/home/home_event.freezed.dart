// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'home_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$HomeEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is HomeEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeEvent()';
  }
}

/// @nodoc
class $HomeEventCopyWith<$Res> {
  $HomeEventCopyWith(HomeEvent _, $Res Function(HomeEvent) __);
}

/// Adds pattern-matching-related methods to [HomeEvent].
extension HomeEventPatterns on HomeEvent {
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
    TResult Function(_Refresh value)? refresh,
    TResult Function(_Sort value)? sort,
    TResult Function(_ToggleSortOrder value)? toggleSortOrder,
    TResult Function(_Search value)? search,
    TResult Function(_TickerUpdated value)? tickerUpdated,
    TResult Function(_LoadMore value)? loadMore,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _Refresh() when refresh != null:
        return refresh(_that);
      case _Sort() when sort != null:
        return sort(_that);
      case _ToggleSortOrder() when toggleSortOrder != null:
        return toggleSortOrder(_that);
      case _Search() when search != null:
        return search(_that);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that);
      case _LoadMore() when loadMore != null:
        return loadMore(_that);
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
    required TResult Function(_Refresh value) refresh,
    required TResult Function(_Sort value) sort,
    required TResult Function(_ToggleSortOrder value) toggleSortOrder,
    required TResult Function(_Search value) search,
    required TResult Function(_TickerUpdated value) tickerUpdated,
    required TResult Function(_LoadMore value) loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that);
      case _Refresh():
        return refresh(_that);
      case _Sort():
        return sort(_that);
      case _ToggleSortOrder():
        return toggleSortOrder(_that);
      case _Search():
        return search(_that);
      case _TickerUpdated():
        return tickerUpdated(_that);
      case _LoadMore():
        return loadMore(_that);
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
    TResult? Function(_Refresh value)? refresh,
    TResult? Function(_Sort value)? sort,
    TResult? Function(_ToggleSortOrder value)? toggleSortOrder,
    TResult? Function(_Search value)? search,
    TResult? Function(_TickerUpdated value)? tickerUpdated,
    TResult? Function(_LoadMore value)? loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _Refresh() when refresh != null:
        return refresh(_that);
      case _Sort() when sort != null:
        return sort(_that);
      case _ToggleSortOrder() when toggleSortOrder != null:
        return toggleSortOrder(_that);
      case _Search() when search != null:
        return search(_that);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that);
      case _LoadMore() when loadMore != null:
        return loadMore(_that);
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
    TResult Function()? refresh,
    TResult Function(SortType sortType)? sort,
    TResult Function()? toggleSortOrder,
    TResult Function(String query)? search,
    TResult Function(List<CoinTickerEntity> tickers)? tickerUpdated,
    TResult Function()? loadMore,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load();
      case _Refresh() when refresh != null:
        return refresh();
      case _Sort() when sort != null:
        return sort(_that.sortType);
      case _ToggleSortOrder() when toggleSortOrder != null:
        return toggleSortOrder();
      case _Search() when search != null:
        return search(_that.query);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that.tickers);
      case _LoadMore() when loadMore != null:
        return loadMore();
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
    required TResult Function() refresh,
    required TResult Function(SortType sortType) sort,
    required TResult Function() toggleSortOrder,
    required TResult Function(String query) search,
    required TResult Function(List<CoinTickerEntity> tickers) tickerUpdated,
    required TResult Function() loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load();
      case _Refresh():
        return refresh();
      case _Sort():
        return sort(_that.sortType);
      case _ToggleSortOrder():
        return toggleSortOrder();
      case _Search():
        return search(_that.query);
      case _TickerUpdated():
        return tickerUpdated(_that.tickers);
      case _LoadMore():
        return loadMore();
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
    TResult? Function()? refresh,
    TResult? Function(SortType sortType)? sort,
    TResult? Function()? toggleSortOrder,
    TResult? Function(String query)? search,
    TResult? Function(List<CoinTickerEntity> tickers)? tickerUpdated,
    TResult? Function()? loadMore,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load();
      case _Refresh() when refresh != null:
        return refresh();
      case _Sort() when sort != null:
        return sort(_that.sortType);
      case _ToggleSortOrder() when toggleSortOrder != null:
        return toggleSortOrder();
      case _Search() when search != null:
        return search(_that.query);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that.tickers);
      case _LoadMore() when loadMore != null:
        return loadMore();
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Load implements HomeEvent {
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
    return 'HomeEvent.load()';
  }
}

/// @nodoc

class _Refresh implements HomeEvent {
  const _Refresh();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Refresh);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeEvent.refresh()';
  }
}

/// @nodoc

class _Sort implements HomeEvent {
  const _Sort(this.sortType);

  final SortType sortType;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SortCopyWith<_Sort> get copyWith =>
      __$SortCopyWithImpl<_Sort>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sort &&
            (identical(other.sortType, sortType) ||
                other.sortType == sortType));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sortType);

  @override
  String toString() {
    return 'HomeEvent.sort(sortType: $sortType)';
  }
}

/// @nodoc
abstract mixin class _$SortCopyWith<$Res> implements $HomeEventCopyWith<$Res> {
  factory _$SortCopyWith(_Sort value, $Res Function(_Sort) _then) =
      __$SortCopyWithImpl;
  @useResult
  $Res call({SortType sortType});
}

/// @nodoc
class __$SortCopyWithImpl<$Res> implements _$SortCopyWith<$Res> {
  __$SortCopyWithImpl(this._self, this._then);

  final _Sort _self;
  final $Res Function(_Sort) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sortType = null,
  }) {
    return _then(_Sort(
      null == sortType
          ? _self.sortType
          : sortType // ignore: cast_nullable_to_non_nullable
              as SortType,
    ));
  }
}

/// @nodoc

class _ToggleSortOrder implements HomeEvent {
  const _ToggleSortOrder();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _ToggleSortOrder);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeEvent.toggleSortOrder()';
  }
}

/// @nodoc

class _Search implements HomeEvent {
  const _Search(this.query);

  final String query;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SearchCopyWith<_Search> get copyWith =>
      __$SearchCopyWithImpl<_Search>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Search &&
            (identical(other.query, query) || other.query == query));
  }

  @override
  int get hashCode => Object.hash(runtimeType, query);

  @override
  String toString() {
    return 'HomeEvent.search(query: $query)';
  }
}

/// @nodoc
abstract mixin class _$SearchCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$SearchCopyWith(_Search value, $Res Function(_Search) _then) =
      __$SearchCopyWithImpl;
  @useResult
  $Res call({String query});
}

/// @nodoc
class __$SearchCopyWithImpl<$Res> implements _$SearchCopyWith<$Res> {
  __$SearchCopyWithImpl(this._self, this._then);

  final _Search _self;
  final $Res Function(_Search) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? query = null,
  }) {
    return _then(_Search(
      null == query
          ? _self.query
          : query // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _TickerUpdated implements HomeEvent {
  const _TickerUpdated(final List<CoinTickerEntity> tickers)
      : _tickers = tickers;

  final List<CoinTickerEntity> _tickers;
  List<CoinTickerEntity> get tickers {
    if (_tickers is EqualUnmodifiableListView) return _tickers;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_tickers);
  }

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$TickerUpdatedCopyWith<_TickerUpdated> get copyWith =>
      __$TickerUpdatedCopyWithImpl<_TickerUpdated>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _TickerUpdated &&
            const DeepCollectionEquality().equals(other._tickers, _tickers));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_tickers));

  @override
  String toString() {
    return 'HomeEvent.tickerUpdated(tickers: $tickers)';
  }
}

/// @nodoc
abstract mixin class _$TickerUpdatedCopyWith<$Res>
    implements $HomeEventCopyWith<$Res> {
  factory _$TickerUpdatedCopyWith(
          _TickerUpdated value, $Res Function(_TickerUpdated) _then) =
      __$TickerUpdatedCopyWithImpl;
  @useResult
  $Res call({List<CoinTickerEntity> tickers});
}

/// @nodoc
class __$TickerUpdatedCopyWithImpl<$Res>
    implements _$TickerUpdatedCopyWith<$Res> {
  __$TickerUpdatedCopyWithImpl(this._self, this._then);

  final _TickerUpdated _self;
  final $Res Function(_TickerUpdated) _then;

  /// Create a copy of HomeEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? tickers = null,
  }) {
    return _then(_TickerUpdated(
      null == tickers
          ? _self._tickers
          : tickers // ignore: cast_nullable_to_non_nullable
              as List<CoinTickerEntity>,
    ));
  }
}

/// @nodoc

class _LoadMore implements HomeEvent {
  const _LoadMore();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _LoadMore);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'HomeEvent.loadMore()';
  }
}

// dart format on
