/// 환율 정보
class ExchangeRateEntity {
  final String fromCurrency;
  final String toCurrency;
  final double rate;
  final DateTime timestamp;

  const ExchangeRateEntity({
    required this.fromCurrency,
    required this.toCurrency,
    required this.rate,
    required this.timestamp,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is ExchangeRateEntity &&
        other.fromCurrency == fromCurrency &&
        other.toCurrency == toCurrency;
  }

  @override
  int get hashCode => fromCurrency.hashCode ^ toCurrency.hashCode;

  @override
  String toString() => 'ExchangeRateEntity($fromCurrency → $toCurrency: $rate)';
}
