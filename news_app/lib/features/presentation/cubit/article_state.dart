import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:news_app/features/domain/entities/article.dart';

abstract class ArticleState extends Equatable {
  final List<Article>? articles;
  final DioException? exception;

  const ArticleState({this.articles, this.exception});

  @override
  List<Object> get props => [articles!, exception!];
}

class ArticleLoading extends ArticleState {
  const ArticleLoading();
}

class ArticleDone extends ArticleState {
  const ArticleDone(List<Article> article) : super(articles: article);
}

class ArticleError extends ArticleState {
  const ArticleError(DioException exception) : super(exception: exception);
}
