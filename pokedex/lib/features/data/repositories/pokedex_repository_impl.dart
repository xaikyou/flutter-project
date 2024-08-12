import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pokedex/core/data_state.dart';
import 'package:pokedex/features/data/models/pokedex/pokedex.dart';
import 'package:pokedex/features/data/sources/pokedex/pokedex_api_service.dart';
import 'package:pokedex/features/domain/repositories/pokedex_repository.dart';

class PokedexRepositoryImpl implements PokedexRepository {
  final PokedexApiService _pokedexApiService;

  PokedexRepositoryImpl(this._pokedexApiService);

  @override
  Future<DataState<Pokedex>> getPokedex() async {
    try {
      Pokedex pokedex = await _pokedexApiService.getPokedex();
      return DataSuccess(pokedex);
    } on DioException catch (e) {
      debugPrint('Error: $e');
      return DataFailure(e);
    }
  }
}
