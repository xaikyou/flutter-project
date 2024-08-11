import 'package:dio/dio.dart';
import 'package:pokedex/config/constants.dart';
import 'package:retrofit/retrofit.dart';
import 'package:pokedex/features/data/models/pokedex/pokedex.dart';

part 'pokedex_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class PokedexApiService {
  factory PokedexApiService(Dio dio, {String baseUrl}) = _PokedexApiService;

  @GET(apiGet)
  Future<Pokedex> getPokedex();
}
