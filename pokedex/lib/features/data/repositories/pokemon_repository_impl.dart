import 'package:dio/dio.dart';
import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/features/data/models/pokemon.dart';
import 'package:pokedex/features/data/sources/pokemon/pokemon_api_service.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';

class PokemonRepositoryImpl implements PokemonRepository {
  final PokemonApiService _pokemonApiService;

  PokemonRepositoryImpl(this._pokemonApiService);

  @override
  Future<DataState<Pokemon>> getPokemon(int index) async {
    try {
      final pokemon = await _pokemonApiService.getPokemon(index.toString());
      return DataSuccess(pokemon);
    } on DioException catch (e) {
      return DataFailure(e);
    }
  }
}
