import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/features/domain/usecases/get_pokedex.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_state.dart';

class PokedexCubit extends Cubit<PokedexState> {
  final GetPokedex getPokedex;

  PokedexCubit(this.getPokedex) : super(const PokedexLoadingState());

  Future<void> fetchPokedex() async {
    emit(const PokedexLoadingState());
    final dataState = await getPokedex();

    if (dataState is DataSuccess && dataState.data != null) {
      emit(PokedexDoneState(dataState.data!));
    }
    if (dataState is DataFailure) {
      emit(PokedexErrorState(dataState.exception!));
    }
  }
}
