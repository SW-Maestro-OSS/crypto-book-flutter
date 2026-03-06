// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'coin_detail_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CoinDetailState {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CoinDetailState);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinDetailState()';
  }
}

/// @nodoc
class $CoinDetailStateCopyWith<$Res> {
  $CoinDetailStateCopyWith(
      CoinDetailState _, $Res Function(CoinDetailState) __);
}

/// Adds pattern-matching-related methods to [CoinDetailState].
extension CoinDetailStatePatterns on CoinDetailState {
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
    TResult Function(_Initial value)? initial,
    TResult Function(_Loading value)? loading,
    TResult Function(_Loaded value)? loaded,
    TResult Function(_Error value)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
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
    required TResult Function(_Initial value) initial,
    required TResult Function(_Loading value) loading,
    required TResult Function(_Loaded value) loaded,
    required TResult Function(_Error value) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial(_that);
      case _Loading():
        return loading(_that);
      case _Loaded():
        return loaded(_that);
      case _Error():
        return error(_that);
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
    TResult? Function(_Initial value)? initial,
    TResult? Function(_Loading value)? loading,
    TResult? Function(_Loaded value)? loaded,
    TResult? Function(_Error value)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial(_that);
      case _Loading() when loading != null:
        return loading(_that);
      case _Loaded() when loaded != null:
        return loaded(_that);
      case _Error() when error != null:
        return error(_that);
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
    TResult Function()? initial,
    TResult Function()? loading,
    TResult Function(
            CoinTickerEntity ticker,
            ChartDataEntity? chartData,
            ChartTimeframe selectedTimeframe,
            bool isLoadingChart,
            List<NewsArticleEntity>? articles,
            bool isLoadingNews,
            AiInsightEntity? aiInsight,
            AiAnalysisStatus aiStatus)?
        loaded,
    TResult Function(AppError error)? error,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.ticker,
            _that.chartData,
            _that.selectedTimeframe,
            _that.isLoadingChart,
            _that.articles,
            _that.isLoadingNews,
            _that.aiInsight,
            _that.aiStatus);
      case _Error() when error != null:
        return error(_that.error);
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
    required TResult Function() initial,
    required TResult Function() loading,
    required TResult Function(
            CoinTickerEntity ticker,
            ChartDataEntity? chartData,
            ChartTimeframe selectedTimeframe,
            bool isLoadingChart,
            List<NewsArticleEntity>? articles,
            bool isLoadingNews,
            AiInsightEntity? aiInsight,
            AiAnalysisStatus aiStatus)
        loaded,
    required TResult Function(AppError error) error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial():
        return initial();
      case _Loading():
        return loading();
      case _Loaded():
        return loaded(
            _that.ticker,
            _that.chartData,
            _that.selectedTimeframe,
            _that.isLoadingChart,
            _that.articles,
            _that.isLoadingNews,
            _that.aiInsight,
            _that.aiStatus);
      case _Error():
        return error(_that.error);
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
    TResult? Function()? initial,
    TResult? Function()? loading,
    TResult? Function(
            CoinTickerEntity ticker,
            ChartDataEntity? chartData,
            ChartTimeframe selectedTimeframe,
            bool isLoadingChart,
            List<NewsArticleEntity>? articles,
            bool isLoadingNews,
            AiInsightEntity? aiInsight,
            AiAnalysisStatus aiStatus)?
        loaded,
    TResult? Function(AppError error)? error,
  }) {
    final _that = this;
    switch (_that) {
      case _Initial() when initial != null:
        return initial();
      case _Loading() when loading != null:
        return loading();
      case _Loaded() when loaded != null:
        return loaded(
            _that.ticker,
            _that.chartData,
            _that.selectedTimeframe,
            _that.isLoadingChart,
            _that.articles,
            _that.isLoadingNews,
            _that.aiInsight,
            _that.aiStatus);
      case _Error() when error != null:
        return error(_that.error);
      case _:
        return null;
    }
  }
}

/// @nodoc

class _Initial implements CoinDetailState {
  const _Initial();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinDetailState.initial()';
  }
}

/// @nodoc

class _Loading implements CoinDetailState {
  const _Loading();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Loading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'CoinDetailState.loading()';
  }
}

/// @nodoc

class _Loaded implements CoinDetailState {
  const _Loaded(
      {required this.ticker,
      this.chartData,
      this.selectedTimeframe = ChartTimeframe.h24,
      this.isLoadingChart = false,
      final List<NewsArticleEntity>? articles,
      this.isLoadingNews = false,
      this.aiInsight,
      this.aiStatus = AiAnalysisStatus.idle})
      : _articles = articles;

  final CoinTickerEntity ticker;
  final ChartDataEntity? chartData;
  @JsonKey()
  final ChartTimeframe selectedTimeframe;
  @JsonKey()
  final bool isLoadingChart;
  final List<NewsArticleEntity>? _articles;
  List<NewsArticleEntity>? get articles {
    final value = _articles;
    if (value == null) return null;
    if (_articles is EqualUnmodifiableListView) return _articles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @JsonKey()
  final bool isLoadingNews;
  final AiInsightEntity? aiInsight;
  @JsonKey()
  final AiAnalysisStatus aiStatus;

  /// Create a copy of CoinDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoadedCopyWith<_Loaded> get copyWith =>
      __$LoadedCopyWithImpl<_Loaded>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Loaded &&
            (identical(other.ticker, ticker) || other.ticker == ticker) &&
            (identical(other.chartData, chartData) ||
                other.chartData == chartData) &&
            (identical(other.selectedTimeframe, selectedTimeframe) ||
                other.selectedTimeframe == selectedTimeframe) &&
            (identical(other.isLoadingChart, isLoadingChart) ||
                other.isLoadingChart == isLoadingChart) &&
            const DeepCollectionEquality().equals(other._articles, _articles) &&
            (identical(other.isLoadingNews, isLoadingNews) ||
                other.isLoadingNews == isLoadingNews) &&
            (identical(other.aiInsight, aiInsight) ||
                other.aiInsight == aiInsight) &&
            (identical(other.aiStatus, aiStatus) ||
                other.aiStatus == aiStatus));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      ticker,
      chartData,
      selectedTimeframe,
      isLoadingChart,
      const DeepCollectionEquality().hash(_articles),
      isLoadingNews,
      aiInsight,
      aiStatus);

  @override
  String toString() {
    return 'CoinDetailState.loaded(ticker: $ticker, chartData: $chartData, selectedTimeframe: $selectedTimeframe, isLoadingChart: $isLoadingChart, articles: $articles, isLoadingNews: $isLoadingNews, aiInsight: $aiInsight, aiStatus: $aiStatus)';
  }
}

/// @nodoc
abstract mixin class _$LoadedCopyWith<$Res>
    implements $CoinDetailStateCopyWith<$Res> {
  factory _$LoadedCopyWith(_Loaded value, $Res Function(_Loaded) _then) =
      __$LoadedCopyWithImpl;
  @useResult
  $Res call(
      {CoinTickerEntity ticker,
      ChartDataEntity? chartData,
      ChartTimeframe selectedTimeframe,
      bool isLoadingChart,
      List<NewsArticleEntity>? articles,
      bool isLoadingNews,
      AiInsightEntity? aiInsight,
      AiAnalysisStatus aiStatus});
}

/// @nodoc
class __$LoadedCopyWithImpl<$Res> implements _$LoadedCopyWith<$Res> {
  __$LoadedCopyWithImpl(this._self, this._then);

  final _Loaded _self;
  final $Res Function(_Loaded) _then;

  /// Create a copy of CoinDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? ticker = null,
    Object? chartData = freezed,
    Object? selectedTimeframe = null,
    Object? isLoadingChart = null,
    Object? articles = freezed,
    Object? isLoadingNews = null,
    Object? aiInsight = freezed,
    Object? aiStatus = null,
  }) {
    return _then(_Loaded(
      ticker: null == ticker
          ? _self.ticker
          : ticker // ignore: cast_nullable_to_non_nullable
              as CoinTickerEntity,
      chartData: freezed == chartData
          ? _self.chartData
          : chartData // ignore: cast_nullable_to_non_nullable
              as ChartDataEntity?,
      selectedTimeframe: null == selectedTimeframe
          ? _self.selectedTimeframe
          : selectedTimeframe // ignore: cast_nullable_to_non_nullable
              as ChartTimeframe,
      isLoadingChart: null == isLoadingChart
          ? _self.isLoadingChart
          : isLoadingChart // ignore: cast_nullable_to_non_nullable
              as bool,
      articles: freezed == articles
          ? _self._articles
          : articles // ignore: cast_nullable_to_non_nullable
              as List<NewsArticleEntity>?,
      isLoadingNews: null == isLoadingNews
          ? _self.isLoadingNews
          : isLoadingNews // ignore: cast_nullable_to_non_nullable
              as bool,
      aiInsight: freezed == aiInsight
          ? _self.aiInsight
          : aiInsight // ignore: cast_nullable_to_non_nullable
              as AiInsightEntity?,
      aiStatus: null == aiStatus
          ? _self.aiStatus
          : aiStatus // ignore: cast_nullable_to_non_nullable
              as AiAnalysisStatus,
    ));
  }
}

/// @nodoc

class _Error implements CoinDetailState {
  const _Error(this.error);

  final AppError error;

  /// Create a copy of CoinDetailState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ErrorCopyWith<_Error> get copyWith =>
      __$ErrorCopyWithImpl<_Error>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Error &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, error);

  @override
  String toString() {
    return 'CoinDetailState.error(error: $error)';
  }
}

/// @nodoc
abstract mixin class _$ErrorCopyWith<$Res>
    implements $CoinDetailStateCopyWith<$Res> {
  factory _$ErrorCopyWith(_Error value, $Res Function(_Error) _then) =
      __$ErrorCopyWithImpl;
  @useResult
  $Res call({AppError error});
}

/// @nodoc
class __$ErrorCopyWithImpl<$Res> implements _$ErrorCopyWith<$Res> {
  __$ErrorCopyWithImpl(this._self, this._then);

  final _Error _self;
  final $Res Function(_Error) _then;

  /// Create a copy of CoinDetailState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? error = null,
  }) {
    return _then(_Error(
      null == error
          ? _self.error
          : error // ignore: cast_nullable_to_non_nullable
              as AppError,
    ));
  }
}

// dart format on
