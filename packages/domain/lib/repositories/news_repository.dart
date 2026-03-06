import 'package:domain/entities/ai_insight_entity.dart';

/// News data repository interface
abstract interface class NewsRepository {
  Future<List<NewsArticleEntity>> getNews(String symbol, {int limit = 5});
}
