import 'package:dio/dio.dart';
import 'package:pokedex/features/data/repositories/pokedex_repository_impl.dart';
import 'package:pokedex/features/data/sources/pokedex/pokedex_api_service.dart';
import 'package:pokedex/features/domain/repositories/pokedex_repository.dart';
import 'package:pokedex/features/domain/usecases/get_pokedex.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_cubit.dart';
import 'package:get_it/get_it.dart';

final sl = GetIt.instance;

Future<void> initializeDependencies() async {
  // Dio
  sl.registerSingleton<Dio>(Dio());

  // Dependencies
  sl.registerSingleton<PokedexApiService>(PokedexApiService(sl()));

  // Repository
  sl.registerSingleton<PokedexRepository>(PokedexRepositoryImpl(sl()));

  // Usecases
  sl.registerSingleton<GetPokedex>(GetPokedex(sl()));

  // Cubit
  sl.registerFactory<PokedexCubit>(() => PokedexCubit(sl()));
}
