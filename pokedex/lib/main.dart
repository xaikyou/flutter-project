import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokedex/config/theme.dart';
import 'package:pokedex/features/presentation/cubit/pokedex/pokedex_cubit.dart';
import 'package:pokedex/features/presentation/cubit/pokemon/pokemon_cubit.dart';
import 'package:pokedex/features/presentation/cubit/pokemon_list_cubit.dart';
import 'package:pokedex/features/presentation/pages/home_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => di.sl<PokedexCubit>()..fetchPokedex(),
        ),
        BlocProvider(
          create: (context) => di.sl<PokemonCubit>()..fetchPokemon(5),
        ),
        BlocProvider(
          create: (context) => PokemonListCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: mainTheme,
        home: const HomePage(),
      ),
    );
  }
}
