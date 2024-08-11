import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/data/models/pokemon.dart';

class PokemonListCubit extends Cubit<List> {
  PokemonListCubit() : super(List.empty());

  void updateList(Pokemon pokemon) {
    List<Pokemon> pokemons = [...state];
    pokemons.add(pokemon);
    emit(pokemons);
  }
}
