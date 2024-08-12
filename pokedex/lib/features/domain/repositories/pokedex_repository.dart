import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/features/data/models/pokedex/pokedex.dart';

abstract class PokedexRepository {
  Future<DataState<Pokedex>> getPokedex();
}
