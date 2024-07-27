import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: Colors.teal.shade100,
    textTheme: GoogleFonts.heptaSlabTextTheme(),
    appBarTheme: appBarTheme(),
  );
}

AppBarTheme appBarTheme() {
  return const AppBarTheme(
    scrolledUnderElevation: 0,
    backgroundColor: Colors.teal,
    elevation: 0,
    centerTitle: true,
    toolbarHeight: 75,
    titleTextStyle: TextStyle(
      fontWeight: FontWeight.bold,
      fontSize: 35,
      color: Color.fromARGB(255, 243, 243, 243),
    ),
  );
}
