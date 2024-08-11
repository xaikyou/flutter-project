import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/features/data/models/pokemon.dart';

abstract class PokemonState extends Equatable {
  final Pokemon? pokemon;
  final DioException? exception;

  const PokemonState({this.pokemon, this.exception});

  @override
  List<Object> get props => [pokemon!, exception!];
}

class PokemonLoadingState extends PokemonState {
  const PokemonLoadingState();
}

class PokemonErrorState extends PokemonState {
  const PokemonErrorState(DioException exception) : super(exception: exception);
}

class PokemonDoneState extends PokemonState {
  const PokemonDoneState(Pokemon pokemon) : super(pokemon: pokemon);
}
