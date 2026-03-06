import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:domain/domain.dart';

part 'coin_detail_state.freezed.dart';

/// Coin Detail state
@freezed
sealed class CoinDetailState with _$CoinDetailState {
  const factory CoinDetailState.initial() = _Initial;
  const factory CoinDetailState.loading() = _Loading;
  const factory CoinDetailState.loaded({
    required CoinTickerEntity ticker,
    ChartDataEntity? chartData,
    @Default(ChartTimeframe.h24) ChartTimeframe selectedTimeframe,
    @Default(false) bool isLoadingChart,
    List<NewsArticleEntity>? articles,
    @Default(false) bool isLoadingNews,
    AiInsightEntity? aiInsight,
    @Default(AiAnalysisStatus.idle) AiAnalysisStatus aiStatus,
  }) = _Loaded;
  const factory CoinDetailState.error(AppError error) = _Error;
}
