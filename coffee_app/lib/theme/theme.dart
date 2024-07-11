import 'package:flutter/material.dart';

// Light Mode
final ThemeData lightMode = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme.light(
        surface: const Color.fromARGB(255, 248, 244, 225),
        primary: Colors.black,
        secondary: Colors.grey.shade200,
        onSurface: const Color.fromARGB(255, 116, 81, 45),
        onPrimary: const Color.fromARGB(255, 175, 143, 111),
        onSecondary: const Color.fromARGB(255, 116, 81, 45)));

// Dark Mode
final ThemeData darkMode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
      surface: Colors.grey.shade900,
      primary: Colors.grey.shade200,
      secondary: Colors.grey.shade800,
      onSurface: const Color.fromARGB(255, 248, 244, 225),
      onPrimary: Colors.grey.shade400,
      onSecondary: Colors.grey.shade200),
);
