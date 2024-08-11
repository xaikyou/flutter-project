import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_cubit.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_state.dart';
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
                    itemCount: pokedexState.pokedex!.results.length,
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
                          child: Text(
                            pokedexState.pokedex!.results[index].name
                                .capitalize(),
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
