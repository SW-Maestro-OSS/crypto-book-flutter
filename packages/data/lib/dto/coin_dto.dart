import 'package:dart_mappable/dart_mappable.dart';
import 'package:domain/domain.dart';

part 'coin_dto.mapper.dart';

@MappableClass()
class CoinDTO with CoinDTOMappable {
  final String symbol;
  final String baseAsset;
  final String quoteAsset;

  CoinDTO({
    required this.symbol,
    required this.baseAsset,
    required this.quoteAsset,
  });

  /// DTO -> Entity 변환
  CoinEntity toEntity() {
    return CoinEntity(
      symbol: symbol,
      baseAsset: baseAsset,
      quoteAsset: quoteAsset,
    );
  }
}
