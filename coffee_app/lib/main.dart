import 'package:coffee_app/models/cart.dart';
import 'package:coffee_app/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const CoffeeApp());
}

class CoffeeApp extends StatelessWidget {
  const CoffeeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        builder: (context, child) => MaterialApp(
              debugShowCheckedModeBanner: false,
              home: const HomePage(),
              theme: ThemeData(fontFamily: 'Monospace'),
            ));
  }
}
