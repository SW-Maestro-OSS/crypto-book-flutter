/// Chart data point representing a single price at a specific time
class ChartDataPoint {
  final DateTime timestamp;
  final double price;

  const ChartDataPoint({
    required this.timestamp,
    required this.price,
  });
}

/// Chart data entity containing multiple data points and metadata
class ChartDataEntity {
  final List<ChartDataPoint> dataPoints;
  final ChartTimeframe timeframe;

  const ChartDataEntity({
    required this.dataPoints,
    required this.timeframe,
  });

  /// Get minimum price in the dataset
  double get minPrice {
    if (dataPoints.isEmpty) return 0;
    return dataPoints.map((p) => p.price).reduce((a, b) => a < b ? a : b);
  }

  /// Get maximum price in the dataset
  double get maxPrice {
    if (dataPoints.isEmpty) return 0;
    return dataPoints.map((p) => p.price).reduce((a, b) => a > b ? a : b);
  }

  /// Get price range (max - min)
  double get priceRange => maxPrice - minPrice;

  /// Check if data is empty
  bool get isEmpty => dataPoints.isEmpty;

  /// Get number of data points
  int get length => dataPoints.length;
}

/// Chart timeframe options
enum ChartTimeframe {
  h24('24H', Duration(hours: 24), '1h'),
  d7('7D', Duration(days: 7), '1d'),
  m1('1M', Duration(days: 30), '1d');

  const ChartTimeframe(this.label, this.duration, this.interval);

  final String label;
  final Duration duration;
  final String interval; // Binance API interval parameter

  /// Get data point count based on timeframe
  int get dataPointCount {
    switch (this) {
      case ChartTimeframe.h24:
        return 24; // 24 hours, 1 data point per hour
      case ChartTimeframe.d7:
        return 7; // 7 days, 1 data point per day
      case ChartTimeframe.m1:
        return 30; // 30 days, 1 data point per day
    }
  }
}
