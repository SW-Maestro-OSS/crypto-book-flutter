// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail_event.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinDetailEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CoinDetailEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinDetailEvent()';
  }
}

/// @nodoc
class $CoinDetailEventCopyWith<$Res> {
  $CoinDetailEventCopyWith(
      CoinDetailEvent _, $Res Function(CoinDetailEvent) __);
}

/// Adds pattern-matching-related methods to [CoinDetailEvent].
extension CoinDetailEventPatterns on CoinDetailEvent {
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
    TResult Function(_TickerUpdated value)? tickerUpdated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that);
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
    required TResult Function(_TickerUpdated value) tickerUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that);
      case _TickerUpdated():
        return tickerUpdated(_that);
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
    TResult? Function(_TickerUpdated value)? tickerUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that);
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
    TResult Function(String symbol)? load,
    TResult Function(CoinTickerEntity ticker)? tickerUpdated,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that.symbol);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that.ticker);
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
    required TResult Function(String symbol) load,
    required TResult Function(CoinTickerEntity ticker) tickerUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that.symbol);
      case _TickerUpdated():
        return tickerUpdated(_that.ticker);
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
    TResult? Function(String symbol)? load,
    TResult? Function(CoinTickerEntity ticker)? tickerUpdated,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that.symbol);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that.ticker);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Load implements CoinDetailEvent {
  const _Load(this.symbol);

  final String symbol;

  /// Create a copy of CoinDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadCopyWith<_Load> get copyWith =>
      __$LoadCopyWithImpl<_Load>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Load &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode => Object.hash(runtimeType, symbol);

  @override
  String toString() {
    return 'CoinDetailEvent.load(symbol: $symbol)';
  }
}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res>
    implements $CoinDetailEventCopyWith<$Res> {
  factory _$LoadCopyWith(_Load value, $Res Function(_Load) _then) =
      __$LoadCopyWithImpl;
  @useResult
  $Res call({String symbol});
}

/// @nodoc
class __$LoadCopyWithImpl<$Res> implements _$LoadCopyWith<$Res> {
  __$LoadCopyWithImpl(this._self, this._then);

  final _Load _self;
  final $Res Function(_Load) _then;

  /// Create a copy of CoinDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? symbol = null,
  }) {
    return _then(_Load(
      null == symbol
          ? _self.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _TickerUpdated implements CoinDetailEvent {
  const _TickerUpdated(this.ticker);

  final CoinTickerEntity ticker;

  /// Create a copy of CoinDetailEvent
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
            (identical(other.ticker, ticker) || other.ticker == ticker));
  }

  @override
  int get hashCode => Object.hash(runtimeType, ticker);

  @override
  String toString() {
    return 'CoinDetailEvent.tickerUpdated(ticker: $ticker)';
  }
}

/// @nodoc
abstract mixin class _$TickerUpdatedCopyWith<$Res>
    implements $CoinDetailEventCopyWith<$Res> {
  factory _$TickerUpdatedCopyWith(
          _TickerUpdated value, $Res Function(_TickerUpdated) _then) =
      __$TickerUpdatedCopyWithImpl;
  @useResult
  $Res call({CoinTickerEntity ticker});
}

/// @nodoc
class __$TickerUpdatedCopyWithImpl<$Res>
    implements _$TickerUpdatedCopyWith<$Res> {
  __$TickerUpdatedCopyWithImpl(this._self, this._then);

  final _TickerUpdated _self;
  final $Res Function(_TickerUpdated) _then;

  /// Create a copy of CoinDetailEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ticker = null,
  }) {
    return _then(_TickerUpdated(
      null == ticker
          ? _self.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as CoinTickerEntity,
    ));
  }
}

// dart format on
