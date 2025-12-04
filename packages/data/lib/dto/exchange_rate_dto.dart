import 'package:dart_mappable/dart_mappable.dart';
import 'package:domain/domain.dart';

part 'exchange_rate_dto.mapper.dart';

@MappableClass()
class ExchangeRateDTO with ExchangeRateDTOMappable {
  final String from;
  final String to;
  final String rate;

  ExchangeRateDTO({
    required this.from,
    required this.to,
    required this.rate,
  });

  ExchangeRateEntity toEntity() {
    return ExchangeRateEntity(
      fromCurrency: from,
      toCurrency: to,
      rate: double.tryParse(rate) ?? 1.0,
      timestamp: DateTime.now(),
    );
  }
}
