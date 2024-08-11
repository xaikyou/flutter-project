import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/features/data/models/pokemon.dart';

abstract class PokemonRepository {
  Future<DataState<Pokemon>> getPokemon(int index);
}
