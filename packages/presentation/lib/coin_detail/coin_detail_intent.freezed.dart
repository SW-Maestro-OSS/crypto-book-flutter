// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail_intent.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinDetailIntent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CoinDetailIntent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinDetailIntent()';
  }
}

/// @nodoc
class $CoinDetailIntentCopyWith<$Res> {
  $CoinDetailIntentCopyWith(
      CoinDetailIntent _, $Res Function(CoinDetailIntent) __);
}

/// Adds pattern-matching-related methods to [CoinDetailIntent].
extension CoinDetailIntentPatterns on CoinDetailIntent {
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
    TResult Function(_ChangeTimeframe value)? changeTimeframe,
    TResult Function(_LoadNews value)? loadNews,
    TResult Function(_NewsLoaded value)? newsLoaded,
    TResult Function(_RequestAiAnalysis value)? requestAiAnalysis,
    TResult Function(_AiAnalysisCompleted value)? aiAnalysisCompleted,
    TResult Function(_AiAnalysisFailed value)? aiAnalysisFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that);
      case _ChangeTimeframe() when changeTimeframe != null:
        return changeTimeframe(_that);
      case _LoadNews() when loadNews != null:
        return loadNews(_that);
      case _NewsLoaded() when newsLoaded != null:
        return newsLoaded(_that);
      case _RequestAiAnalysis() when requestAiAnalysis != null:
        return requestAiAnalysis(_that);
      case _AiAnalysisCompleted() when aiAnalysisCompleted != null:
        return aiAnalysisCompleted(_that);
      case _AiAnalysisFailed() when aiAnalysisFailed != null:
        return aiAnalysisFailed(_that);
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
    required TResult Function(_ChangeTimeframe value) changeTimeframe,
    required TResult Function(_LoadNews value) loadNews,
    required TResult Function(_NewsLoaded value) newsLoaded,
    required TResult Function(_RequestAiAnalysis value) requestAiAnalysis,
    required TResult Function(_AiAnalysisCompleted value) aiAnalysisCompleted,
    required TResult Function(_AiAnalysisFailed value) aiAnalysisFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that);
      case _TickerUpdated():
        return tickerUpdated(_that);
      case _ChangeTimeframe():
        return changeTimeframe(_that);
      case _LoadNews():
        return loadNews(_that);
      case _NewsLoaded():
        return newsLoaded(_that);
      case _RequestAiAnalysis():
        return requestAiAnalysis(_that);
      case _AiAnalysisCompleted():
        return aiAnalysisCompleted(_that);
      case _AiAnalysisFailed():
        return aiAnalysisFailed(_that);
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
    TResult? Function(_ChangeTimeframe value)? changeTimeframe,
    TResult? Function(_LoadNews value)? loadNews,
    TResult? Function(_NewsLoaded value)? newsLoaded,
    TResult? Function(_RequestAiAnalysis value)? requestAiAnalysis,
    TResult? Function(_AiAnalysisCompleted value)? aiAnalysisCompleted,
    TResult? Function(_AiAnalysisFailed value)? aiAnalysisFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that);
      case _ChangeTimeframe() when changeTimeframe != null:
        return changeTimeframe(_that);
      case _LoadNews() when loadNews != null:
        return loadNews(_that);
      case _NewsLoaded() when newsLoaded != null:
        return newsLoaded(_that);
      case _RequestAiAnalysis() when requestAiAnalysis != null:
        return requestAiAnalysis(_that);
      case _AiAnalysisCompleted() when aiAnalysisCompleted != null:
        return aiAnalysisCompleted(_that);
      case _AiAnalysisFailed() when aiAnalysisFailed != null:
        return aiAnalysisFailed(_that);
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
    TResult Function(ChartTimeframe timeframe)? changeTimeframe,
    TResult Function(String symbol)? loadNews,
    TResult Function(List<NewsArticleEntity> articles)? newsLoaded,
    TResult Function()? requestAiAnalysis,
    TResult Function(AiInsightEntity insight)? aiAnalysisCompleted,
    TResult Function(String error)? aiAnalysisFailed,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that.symbol);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that.ticker);
      case _ChangeTimeframe() when changeTimeframe != null:
        return changeTimeframe(_that.timeframe);
      case _LoadNews() when loadNews != null:
        return loadNews(_that.symbol);
      case _NewsLoaded() when newsLoaded != null:
        return newsLoaded(_that.articles);
      case _RequestAiAnalysis() when requestAiAnalysis != null:
        return requestAiAnalysis();
      case _AiAnalysisCompleted() when aiAnalysisCompleted != null:
        return aiAnalysisCompleted(_that.insight);
      case _AiAnalysisFailed() when aiAnalysisFailed != null:
        return aiAnalysisFailed(_that.error);
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
    required TResult Function(ChartTimeframe timeframe) changeTimeframe,
    required TResult Function(String symbol) loadNews,
    required TResult Function(List<NewsArticleEntity> articles) newsLoaded,
    required TResult Function() requestAiAnalysis,
    required TResult Function(AiInsightEntity insight) aiAnalysisCompleted,
    required TResult Function(String error) aiAnalysisFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Load():
        return load(_that.symbol);
      case _TickerUpdated():
        return tickerUpdated(_that.ticker);
      case _ChangeTimeframe():
        return changeTimeframe(_that.timeframe);
      case _LoadNews():
        return loadNews(_that.symbol);
      case _NewsLoaded():
        return newsLoaded(_that.articles);
      case _RequestAiAnalysis():
        return requestAiAnalysis();
      case _AiAnalysisCompleted():
        return aiAnalysisCompleted(_that.insight);
      case _AiAnalysisFailed():
        return aiAnalysisFailed(_that.error);
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
    TResult? Function(ChartTimeframe timeframe)? changeTimeframe,
    TResult? Function(String symbol)? loadNews,
    TResult? Function(List<NewsArticleEntity> articles)? newsLoaded,
    TResult? Function()? requestAiAnalysis,
    TResult? Function(AiInsightEntity insight)? aiAnalysisCompleted,
    TResult? Function(String error)? aiAnalysisFailed,
  }) {
    final _that = this;
    switch (_that) {
      case _Load() when load != null:
        return load(_that.symbol);
      case _TickerUpdated() when tickerUpdated != null:
        return tickerUpdated(_that.ticker);
      case _ChangeTimeframe() when changeTimeframe != null:
        return changeTimeframe(_that.timeframe);
      case _LoadNews() when loadNews != null:
        return loadNews(_that.symbol);
      case _NewsLoaded() when newsLoaded != null:
        return newsLoaded(_that.articles);
      case _RequestAiAnalysis() when requestAiAnalysis != null:
        return requestAiAnalysis();
      case _AiAnalysisCompleted() when aiAnalysisCompleted != null:
        return aiAnalysisCompleted(_that.insight);
      case _AiAnalysisFailed() when aiAnalysisFailed != null:
        return aiAnalysisFailed(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Load implements CoinDetailIntent {
  const _Load(this.symbol);

  final String symbol;

  /// Create a copy of CoinDetailIntent
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
    return 'CoinDetailIntent.load(symbol: $symbol)';
  }
}

/// @nodoc
abstract mixin class _$LoadCopyWith<$Res>
    implements $CoinDetailIntentCopyWith<$Res> {
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

  /// Create a copy of CoinDetailIntent
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

class _TickerUpdated implements CoinDetailIntent {
  const _TickerUpdated(this.ticker);

  final CoinTickerEntity ticker;

  /// Create a copy of CoinDetailIntent
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
    return 'CoinDetailIntent.tickerUpdated(ticker: $ticker)';
  }
}

/// @nodoc
abstract mixin class _$TickerUpdatedCopyWith<$Res>
    implements $CoinDetailIntentCopyWith<$Res> {
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

  /// Create a copy of CoinDetailIntent
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

/// @nodoc

class _ChangeTimeframe implements CoinDetailIntent {
  const _ChangeTimeframe(this.timeframe);

  final ChartTimeframe timeframe;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChangeTimeframeCopyWith<_ChangeTimeframe> get copyWith =>
      __$ChangeTimeframeCopyWithImpl<_ChangeTimeframe>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChangeTimeframe &&
            (identical(other.timeframe, timeframe) ||
                other.timeframe == timeframe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, timeframe);

  @override
  String toString() {
    return 'CoinDetailIntent.changeTimeframe(timeframe: $timeframe)';
  }
}

/// @nodoc
abstract mixin class _$ChangeTimeframeCopyWith<$Res>
    implements $CoinDetailIntentCopyWith<$Res> {
  factory _$ChangeTimeframeCopyWith(
          _ChangeTimeframe value, $Res Function(_ChangeTimeframe) _then) =
      __$ChangeTimeframeCopyWithImpl;
  @useResult
  $Res call({ChartTimeframe timeframe});
}

/// @nodoc
class __$ChangeTimeframeCopyWithImpl<$Res>
    implements _$ChangeTimeframeCopyWith<$Res> {
  __$ChangeTimeframeCopyWithImpl(this._self, this._then);

  final _ChangeTimeframe _self;
  final $Res Function(_ChangeTimeframe) _then;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? timeframe = null,
  }) {
    return _then(_ChangeTimeframe(
      null == timeframe
          ? _self.timeframe
          : timeframe // ignore: cast_nullable_to_non_nullable
              as ChartTimeframe,
    ));
  }
}

/// @nodoc

class _LoadNews implements CoinDetailIntent {
  const _LoadNews(this.symbol);

  final String symbol;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadNewsCopyWith<_LoadNews> get copyWith =>
      __$LoadNewsCopyWithImpl<_LoadNews>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoadNews &&
            (identical(other.symbol, symbol) || other.symbol == symbol));
  }

  @override
  int get hashCode => Object.hash(runtimeType, symbol);

  @override
  String toString() {
    return 'CoinDetailIntent.loadNews(symbol: $symbol)';
  }
}

/// @nodoc
abstract mixin class _$LoadNewsCopyWith<$Res>
    implements $CoinDetailIntentCopyWith<$Res> {
  factory _$LoadNewsCopyWith(_LoadNews value, $Res Function(_LoadNews) _then) =
      __$LoadNewsCopyWithImpl;
  @useResult
  $Res call({String symbol});
}

/// @nodoc
class __$LoadNewsCopyWithImpl<$Res> implements _$LoadNewsCopyWith<$Res> {
  __$LoadNewsCopyWithImpl(this._self, this._then);

  final _LoadNews _self;
  final $Res Function(_LoadNews) _then;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? symbol = null,
  }) {
    return _then(_LoadNews(
      null == symbol
          ? _self.symbol
          : symbol // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _NewsLoaded implements CoinDetailIntent {
  const _NewsLoaded(final List<NewsArticleEntity> articles)
      : _articles = articles;

  final List<NewsArticleEntity> _articles;
  List<NewsArticleEntity> get articles {
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_articles);
  }

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NewsLoadedCopyWith<_NewsLoaded> get copyWith =>
      __$NewsLoadedCopyWithImpl<_NewsLoaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NewsLoaded &&
            const DeepCollectionEquality().equals(other._articles, _articles));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_articles));

  @override
  String toString() {
    return 'CoinDetailIntent.newsLoaded(articles: $articles)';
  }
}

/// @nodoc
abstract mixin class _$NewsLoadedCopyWith<$Res>
    implements $CoinDetailIntentCopyWith<$Res> {
  factory _$NewsLoadedCopyWith(
          _NewsLoaded value, $Res Function(_NewsLoaded) _then) =
      __$NewsLoadedCopyWithImpl;
  @useResult
  $Res call({List<NewsArticleEntity> articles});
}

/// @nodoc
class __$NewsLoadedCopyWithImpl<$Res> implements _$NewsLoadedCopyWith<$Res> {
  __$NewsLoadedCopyWithImpl(this._self, this._then);

  final _NewsLoaded _self;
  final $Res Function(_NewsLoaded) _then;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? articles = null,
  }) {
    return _then(_NewsLoaded(
      null == articles
          ? _self._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticleEntity>,
    ));
  }
}

/// @nodoc

class _RequestAiAnalysis implements CoinDetailIntent {
  const _RequestAiAnalysis();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _RequestAiAnalysis);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinDetailIntent.requestAiAnalysis()';
  }
}

/// @nodoc

class _AiAnalysisCompleted implements CoinDetailIntent {
  const _AiAnalysisCompleted(this.insight);

  final AiInsightEntity insight;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiAnalysisCompletedCopyWith<_AiAnalysisCompleted> get copyWith =>
      __$AiAnalysisCompletedCopyWithImpl<_AiAnalysisCompleted>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiAnalysisCompleted &&
            (identical(other.insight, insight) || other.insight == insight));
  }

  @override
  int get hashCode => Object.hash(runtimeType, insight);

  @override
  String toString() {
    return 'CoinDetailIntent.aiAnalysisCompleted(insight: $insight)';
  }
}

/// @nodoc
abstract mixin class _$AiAnalysisCompletedCopyWith<$Res>
    implements $CoinDetailIntentCopyWith<$Res> {
  factory _$AiAnalysisCompletedCopyWith(_AiAnalysisCompleted value,
          $Res Function(_AiAnalysisCompleted) _then) =
      __$AiAnalysisCompletedCopyWithImpl;
  @useResult
  $Res call({AiInsightEntity insight});
}

/// @nodoc
class __$AiAnalysisCompletedCopyWithImpl<$Res>
    implements _$AiAnalysisCompletedCopyWith<$Res> {
  __$AiAnalysisCompletedCopyWithImpl(this._self, this._then);

  final _AiAnalysisCompleted _self;
  final $Res Function(_AiAnalysisCompleted) _then;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? insight = null,
  }) {
    return _then(_AiAnalysisCompleted(
      null == insight
          ? _self.insight
          : insight // ignore: cast_nullable_to_non_nullable
              as AiInsightEntity,
    ));
  }
}

/// @nodoc

class _AiAnalysisFailed implements CoinDetailIntent {
  const _AiAnalysisFailed(this.error);

  final String error;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$AiAnalysisFailedCopyWith<_AiAnalysisFailed> get copyWith =>
      __$AiAnalysisFailedCopyWithImpl<_AiAnalysisFailed>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _AiAnalysisFailed &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'CoinDetailIntent.aiAnalysisFailed(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$AiAnalysisFailedCopyWith<$Res>
    implements $CoinDetailIntentCopyWith<$Res> {
  factory _$AiAnalysisFailedCopyWith(
          _AiAnalysisFailed value, $Res Function(_AiAnalysisFailed) _then) =
      __$AiAnalysisFailedCopyWithImpl;
  @useResult
  $Res call({String error});
}

/// @nodoc
class __$AiAnalysisFailedCopyWithImpl<$Res>
    implements _$AiAnalysisFailedCopyWith<$Res> {
  __$AiAnalysisFailedCopyWithImpl(this._self, this._then);

  final _AiAnalysisFailed _self;
  final $Res Function(_AiAnalysisFailed) _then;

  /// Create a copy of CoinDetailIntent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_AiAnalysisFailed(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
