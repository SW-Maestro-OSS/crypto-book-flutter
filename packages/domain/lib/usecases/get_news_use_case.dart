import 'package:domain/entities/ai_insight_entity.dart';
import 'package:domain/repositories/news_repository.dart';

/// UseCase for fetching news articles for a coin
abstract interface class GetNewsUseCase {
  Future<List<NewsArticleEntity>> execute(String symbol, {int limit = 5});
}

class GetNewsUseCaseImpl implements GetNewsUseCase {
  final NewsRepository repository;

  GetNewsUseCaseImpl({required this.repository});

  @override
  Future<List<NewsArticleEntity>> execute(String symbol, {int limit = 5}) {
    return repository.getNews(symbol, limit: limit);
  }
}
