import 'package:flutter/material.dart';
import 'package:note_taking_app/components/pop_up_menu.dart';
import 'package:note_taking_app/pages/all_notes_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Notes',
          style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(Icons.search,
                  color: Theme.of(context).colorScheme.primary)),
          IconButton(onPressed: () {}, icon: const PopUpMenu()),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          const Expanded(
            child: AllNotesPage(),
          ),
        ],
      ),
    );
  }
}
