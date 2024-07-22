import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:news_app/features/data/repositories/article_repository_impl.dart';
import 'package:news_app/features/data/services/api_service.dart';
import 'package:news_app/features/domain/repositories/article_repository.dart';
import 'package:news_app/features/domain/usecases/get_article.dart';
import 'package:news_app/features/presentation/cubit/article_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl()));

  sl.registerSingleton<ArticleRepository>(ArticleRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<GetArticleUseCase>(GetArticleUseCase(sl()));

  // Cubit
  sl.registerFactory<ArticleCubit>(() => ArticleCubit(sl()));
}
