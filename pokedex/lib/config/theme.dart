import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData mainTheme = ThemeData(
  useMaterial3: true,
  textTheme: GoogleFonts.paytoneOneTextTheme(),
  scaffoldBackgroundColor: const Color.fromARGB(255, 245, 245, 245),
  appBarTheme: appBarTheme,
);

AppBarTheme appBarTheme = const AppBarTheme(
  backgroundColor: Colors.transparent,
  elevation: 0,
  scrolledUnderElevation: 0,
);
