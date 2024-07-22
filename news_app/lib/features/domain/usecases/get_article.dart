import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/core/usecases/usecase.dart';
import 'package:news_app/features/domain/entities/article.dart';
import 'package:news_app/features/domain/repositories/article_repository.dart';

class GetArticleUseCase implements Usecase<DataState<List<Article>>, void> {
  final ArticleRepository _articleRepository;

  GetArticleUseCase(this._articleRepository);

  @override
  Future<DataState<List<Article>>> call({void params}) {
    return _articleRepository.getNewArticles();
  }
}
