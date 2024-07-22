import 'package:dio/dio.dart';
import 'package:news_app/core/constants/constants.dart';
import 'package:news_app/features/data/models/article_model.dart';
import 'package:retrofit/http.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: apiBaseURL)
abstract class ApiService {
  factory ApiService(Dio dio) = _ApiService;

  @GET('top-headlines?/')
  Future<List<ArticleModel>> getArticles({
    @Query('sources') String? sources,
    @Query('apiKey') String? apiKey,
  });
}
