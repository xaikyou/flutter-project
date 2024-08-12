import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_cubit.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_state.dart';
import 'package:pokedex/features/presentation/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/features/presentation/cubit/pokemon/pokemon_state.dart';
import '../../../core/utils.dart';

class PokemonListWidget extends StatefulWidget {
  const PokemonListWidget({super.key});

  @override
  State<PokemonListWidget> createState() => _PokemonListWidgetState();
}

class _PokemonListWidgetState extends State<PokemonListWidget> {
  late PokemonCubit _pokemonCubit;

  @override
  void initState() {
    super.initState();
    _pokemonCubit = BlocProvider.of<PokemonCubit>(context);

    for (int i = 1; i <= 50; i++) {
      _pokemonCubit.fetchPokemon(i);
    }
  }

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
                  return BlocBuilder<PokemonCubit, PokemonState>(
                    builder: (context, pokemonState) {
                      return GridView.builder(
                        itemCount: 50,
                        gridDelegate:
                            const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemBuilder: (context, index) {
                          final pokemon = _pokemonCubit.pokemonList[index + 1];

                          if (pokemon != null) {
                            return Card(
                              color: whiteColor,
                              margin: EdgeInsets.zero,
                              elevation: 3,
                              child: SafeArea(
                                child: Column(
                                  children: [
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10),
                                        child: Text("#${pokemon.id}"),
                                      ),
                                    ),
                                    Expanded(
                                      child: Image.network(
                                        pokemon.sprites.other!.officialArtwork
                                            .frontDefault,
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
                              ),
                            );
                          }
                          return Center(
                            child: CircularProgressIndicator(
                              color: Colors.red.shade700,
                            ),
                          );
                        },
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
