import 'package:flutter/material.dart';

final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: const ColorScheme.light(
        surface: Color.fromARGB(255, 246, 246, 246),
        primary: Color.fromARGB(255, 49, 49, 49)));

final ThemeData darkMode = ThemeData(
    brightness: Brightness.dark,
    colorScheme: const ColorScheme.dark(
        surface: Color.fromARGB(255, 49, 49, 49),
        primary: Color.fromARGB(255, 253, 253, 253)));
