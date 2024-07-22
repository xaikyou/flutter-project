import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:news_app/features/data/services/api_service.dart';
import 'package:news_app/features/domain/repositories/article_repository.dart';

class ArticleRepositoryImpl implements ArticleRepository {
  final ApiService _apiService;

  ArticleRepositoryImpl(this._apiService);

  @override
  Future<DataState<List<ArticleModel>>> getNewArticles() async {
    try {
      List<ArticleModel> articles = await _apiService.getArticles(
        sources: sourcesQuery,
        apiKey: newsAPIKey,
      );
      return DataSuccess(articles);
    } catch (e) {
      return DataFailed(e is DioException
          ? e
          : DioException(
              requestOptions: RequestOptions(path: ''), error: e.toString()));
    }
  }
}
