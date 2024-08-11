import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_cubit.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_state.dart';
import 'package:pokedex/features/presentation/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/features/presentation/cubit/pokemon/pokemon_state.dart';
import '../../../core/utils.dart';

class PokemonListWidget extends StatelessWidget {
  const PokemonListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
        child: Card(
          margin: EdgeInsets.zero,
          color: whiteColor,
          child: SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: BlocBuilder<PokedexCubit, PokedexState>(
                builder: (context, pokedexState) {
                  if (pokedexState is PokedexLoadingState) {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.red.shade700,
                      ),
                    );
                  }
                  if (pokedexState is PokedexErrorState) {
                    return const Center(
                      child: Icon(Icons.refresh),
                    );
                  }
                  return GridView.builder(
                    itemCount: 2, // pokedexState.pokedex!.results.length,
                    gridDelegate:
                        const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return Card(
                        color: whiteColor,
                        margin: EdgeInsets.zero,
                        elevation: 3,
                        child: SafeArea(
                          child: BlocBuilder<PokemonCubit, PokemonState>(
                            builder: (context, pokemonState) {
                              if (pokemonState is PokemonLoadingState) {
                                return Center(
                                  child: CircularProgressIndicator(
                                    color: Colors.red.shade700,
                                  ),
                                );
                              }
                              if (pokemonState is PokemonErrorState) {
                                return Center(
                                  child: Icon(
                                    Icons.warning_amber_rounded,
                                    color: Colors.red.shade700,
                                  ),
                                );
                              }
                              for (var i = 0; i < 2; i++) {}
                              return SizedBox(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text(
                                            "#${pokemonState.pokemon!.id}"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.network(
                                        pokemonState.pokemon!.sprites.other!
                                            .officialArtwork.frontDefault,
                                        fit: BoxFit.contain,
                                      ),
                                    ),
                                    Text(
                                      pokedexState.pokedex!.results[index].name
                                          .capitalize(),
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }
}
