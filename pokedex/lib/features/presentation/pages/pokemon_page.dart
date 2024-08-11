import 'package:flutter/material.dart';
import 'package:pokedex/features/presentation/widgets/pokemon_list_widget.dart';
import 'package:pokedex/features/presentation/widgets/search_bar_widget.dart';

class PokemonPage extends StatelessWidget {
  const PokemonPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController searchTextController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.red.shade700,
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: SearchBarWidget(
              controller: searchTextController,
            ),
          ),
          const PokemonListWidget(),
        ],
      ),
    );
  }
}
