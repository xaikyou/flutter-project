import 'package:dio/dio.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/features/data/models/pokemon.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

part 'pokemon_api_service.g.dart';

@RestApi(baseUrl: apiBaseUrl)
abstract class PokemonApiService {
  factory PokemonApiService(Dio dio, {String baseUrl}) = _PokemonApiService;

  @GET('pokemon/{number}')
  Future<Pokemon> getPokemon(@Path('number') String number);
}
