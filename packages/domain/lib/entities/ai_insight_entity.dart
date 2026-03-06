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
}

/// AI analysis status
enum AiAnalysisStatus {
  idle,
  loading,
  completed,
  unavailable,
  error,
}

/// News article entity
class NewsArticleEntity {
  final String title;
  final String source;
  final DateTime publishedAt;
  final String url;

  const NewsArticleEntity({
    required this.title,
    required this.source,
    required this.publishedAt,
    required this.url,
  });
}
