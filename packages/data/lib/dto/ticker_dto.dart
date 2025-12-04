import 'package:dart_mappable/dart_mappable.dart';
import 'package:domain/domain.dart';

part 'ticker_dto.mapper.dart';

@MappableClass()
class TickerDTO with TickerDTOMappable {
  final String symbol;
  @MappableField(key: 'c')
  final String currentPrice;
  @MappableField(key: 'p')
  final String priceChange;
  @MappableField(key: 'P')
  final String priceChangePercent;
  @MappableField(key: 'h')
  final String high;
  @MappableField(key: 'l')
  final String low;
  @MappableField(key: 'v')
  final String volume;
  final String? imageUrl;

  TickerDTO({
    required this.symbol,
    required this.currentPrice,
    required this.priceChange,
    required this.priceChangePercent,
    required this.high,
    required this.low,
    required this.volume,
    this.imageUrl,
  });

  /// DTO -> Entity 변환
  CoinTickerEntity toEntity() {
    return CoinTickerEntity(
      symbol: symbol,
      currentPrice: double.tryParse(currentPrice) ?? 0.0,
      priceChange24h: double.tryParse(priceChange) ?? 0.0,
      priceChangePercent24h: double.tryParse(priceChangePercent) ?? 0.0,
      high24h: double.tryParse(high) ?? 0.0,
      low24h: double.tryParse(low) ?? 0.0,
      volume24h: double.tryParse(volume) ?? 0.0,
      timestamp: DateTime.now(),
      imageUrl: imageUrl,
    );
  }
}
