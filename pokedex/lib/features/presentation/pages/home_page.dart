import 'package:flutter/material.dart';
import 'package:pokedex/config/constants.dart';
import 'package:pokedex/features/presentation/pages/pokemon_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red.shade700,
        title: const Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.catching_pokemon_sharp,
              size: 40,
              color: Colors.white,
            ),
            SizedBox(width: 20),
            Text(
              'Pokédex',
              style: TextStyle(fontSize: titleSize, color: Colors.white),
            ),
          ],
        ),
      ),
      body: const PokemonPage(),
    );
  }
}
