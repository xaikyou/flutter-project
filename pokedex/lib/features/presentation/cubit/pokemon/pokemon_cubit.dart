import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/features/domain/usecases/get_pokemon.dart';
import 'package:pokedex/features/presentation/cubit/pokemon/pokemon_state.dart';

class PokemonCubit extends Cubit<PokemonState> {
  final GetPokemon getPokemon;
  PokemonCubit(this.getPokemon) : super(const PokemonLoadingState());

  Future<void> fetchPokemon(int index) async {
    emit(const PokemonLoadingState());
    final dataState = await getPokemon(Params<int>(param: index));

    if (dataState is DataSuccess && dataState.data != null) {
      emit(PokemonDoneState(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(PokemonErrorState(dataState.exception!));
    }
  }
}
