import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/resources/data_state.dart';
import 'package:news_app/features/domain/usecases/get_article.dart';
import 'package:news_app/features/presentation/cubit/article_state.dart';

class ArticleCubit extends Cubit<ArticleState> {
  final GetArticleUseCase _getArticleUseCase;

  ArticleCubit(this._getArticleUseCase) : super(const ArticleLoading());

  Future<void> getArticles() async {
    final dataState = await _getArticleUseCase();

    if (dataState is DataSuccess && dataState.data!.isNotEmpty) {
      emit(ArticleDone(dataState.data!));
    }
    if (dataState is DataFailed) {
      emit(ArticleError(dataState.exception!));
    }
  }
}
