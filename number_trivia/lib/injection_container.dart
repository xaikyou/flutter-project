import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:number_trivia/features/data/repositories/number_trivia_repository_impl.dart';
import 'package:number_trivia/features/data/sources/api_service.dart';
import 'package:number_trivia/features/domain/repositories/number_trivia_repository.dart';
import 'package:number_trivia/features/domain/usecases/get_concrete_number_trivia.dart';
import 'package:number_trivia/features/domain/usecases/get_random_number_trivia.dart';
import 'package:number_trivia/features/presentation/cubit/number_trivia_cubit.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<ApiService>(ApiService(sl()));
  sl.registerSingleton<NumberTriviaRepository>(
      NumberTriviaRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<GetConcreteNumberTrivia>(GetConcreteNumberTrivia(sl()));
  sl.registerSingleton<GetRandomNumberTrivia>(GetRandomNumberTrivia(sl()));

  // Cubit
  sl.registerSingleton<NumberTriviaCubit>(NumberTriviaCubit(
    sl<GetConcreteNumberTrivia>(),
    sl<GetRandomNumberTrivia>(),
  ));
}
