import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/features/data/models/pokemon.dart';
import 'package:pokedex/features/domain/repositories/pokemon_repository.dart';

class GetPokemon implements Usecase<DataState<Pokemon>, Params<int>> {
  final PokemonRepository _pokemonRepository;

  GetPokemon(this._pokemonRepository);

  @override
  Future<DataState<Pokemon>> call(Params params) async {
    return await _pokemonRepository.getPokemon(params.param);
  }
}
