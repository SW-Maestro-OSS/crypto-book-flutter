/// AI-generated insights for a cryptocurrency
class AiInsightEntity {
  final String symbol;
  final List<String> insights;
  final double buyPressure; // 0.0 to 1.0
  final double sellPressure; // 0.0 to 1.0
  final DateTime generatedAt;

  const AiInsightEntity({
    required this.symbol,
    required this.insights,
    required this.buyPressure,
    required this.sellPressure,
    required this.generatedAt,
  });

  /// Generate mock AI insights for testing
  factory AiInsightEntity.mock(String symbol) {
    return AiInsightEntity(
      symbol: symbol,
      insights: [
        'Strong upward momentum in the last 24 hours',
        'Trading volume is above average',
        'Price is approaching resistance level at \$45,000',
        'Technical indicators suggest bullish trend',
      ],
      buyPressure: 0.68,
      sellPressure: 0.32,
      generatedAt: DateTime.now(),
    );
  }
}

/// News article entity
class NewsArticleEntity {
  final String title;
  final String source;
  final DateTime publishedAt;
  final String? url;

  const NewsArticleEntity({
    required this.title,
    required this.source,
    required this.publishedAt,
    this.url,
  });

  /// Generate mock news articles for testing
  static List<NewsArticleEntity> mockList(String symbol) {
    final now = DateTime.now();
    return [
      NewsArticleEntity(
        title: '$symbol Breaks Key Resistance Level',
        source: 'CryptoNews',
        publishedAt: now.subtract(const Duration(hours: 2)),
        url: 'https://cryptonews.com/article/1',
      ),
      NewsArticleEntity(
        title: 'Market Analysis: $symbol Shows Strong Support',
        source: 'Bloomberg Crypto',
        publishedAt: now.subtract(const Duration(hours: 5)),
        url: 'https://bloomberg.com/crypto/2',
      ),
      NewsArticleEntity(
        title: 'Institutional Interest in $symbol Growing',
        source: 'CoinDesk',
        publishedAt: now.subtract(const Duration(hours: 12)),
        url: 'https://coindesk.com/article/3',
      ),
    ];
  }
}
