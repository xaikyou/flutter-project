import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:pokedex/features/data/models/pokedex.dart';

abstract class PokedexState extends Equatable {
  final Pokedex? pokedex;
  final DioException? exception;

  const PokedexState({this.pokedex, this.exception});

  @override
  List<Object> get props => [pokedex!, exception!];
}

class PokedexLoadingState extends PokedexState {
  const PokedexLoadingState();
}

class PokedexErrorState extends PokedexState {
  const PokedexErrorState(DioException exception) : super(exception: exception);
}

class PokedexDoneState extends PokedexState {
  const PokedexDoneState(Pokedex pokedex) : super(pokedex: pokedex);
}
