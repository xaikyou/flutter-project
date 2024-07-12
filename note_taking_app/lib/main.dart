import 'package:flutter/material.dart';
import 'package:note_taking_app/pages/all_notes_page.dart';
import 'package:note_taking_app/pages/home_page.dart';
import 'package:note_taking_app/pages/recycle_bin_page.dart';
import 'package:note_taking_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) => ThemeProvider(), child: const NoteTakingApp()));
}

class NoteTakingApp extends StatelessWidget {
  const NoteTakingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      theme: ThemeData(fontFamily: 'Monospace').copyWith(
        colorScheme: Provider.of<ThemeProvider>(context).themeData.colorScheme,
      ),
      routes: {
        '/allNotes': (context) => const AllNotesPage(),
        '/recycleBin': (context) => const RecycleBinPage(),
      },
    );
  }
}
