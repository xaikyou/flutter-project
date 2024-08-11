import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/core/usecase.dart';
import 'package:pokedex/features/data/models/pokedex/pokedex.dart';
import 'package:pokedex/features/domain/repositories/pokedex_repository.dart';

class GetPokedex implements Usecase<DataState<Pokedex>, void> {
  final PokedexRepository _pokedexRepository;

  GetPokedex(this._pokedexRepository);

  @override
  Future<DataState<Pokedex>> call({void params}) {
    return _pokedexRepository.getPokedex();
  }
}
