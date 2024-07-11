import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:coffee_app/models/cart.dart';
import 'package:coffee_app/pages/home_page.dart';
import 'package:coffee_app/pages/settings_page.dart';
import 'package:coffee_app/theme/theme_provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeProvider(),
      child: const CoffeeApp(),
    ),
  );
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => Cart(),
      builder: (context, child) {
        final themeProvider = Provider.of<ThemeProvider>(context);

        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: const HomePage(),
          theme: ThemeData(
            fontFamily: 'monospace',
            brightness: Brightness.light,
          ).copyWith(
            colorScheme: themeProvider.themeData.colorScheme,
          ),
          routes: {
            '/settingspage': (context) => const SettingsPage(),
          },
        );
      },
    );
  }
}
