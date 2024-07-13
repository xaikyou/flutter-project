import 'package:flutter/material.dart';
import 'package:note_taking_app/models/note_database.dart';
import 'package:note_taking_app/pages/all_notes_page.dart';
import 'package:note_taking_app/pages/home_page.dart';
import 'package:note_taking_app/pages/new_note_page.dart';
import 'package:note_taking_app/pages/settings_page.dart';
import 'package:note_taking_app/theme/theme_provider.dart';
import 'package:provider/provider.dart';

void main() async {
  // Initialize note isar database
  WidgetsFlutterBinding.ensureInitialized();
  await NoteDatabase.initialize();

  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ChangeNotifierProvider(create: (context) => NoteDatabase())
  ], child: const NoteTakingApp()));
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
        '/newNote': (context) => const NewNotePage(),
        '/settingspage': (context) => const SettingsPage(),
      },
    );
  }
}
