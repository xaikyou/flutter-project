import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:note_taking_app/pages/all_notes_page.dart';
import 'package:note_taking_app/pages/recycle_bin_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const AllNotesPage(),
    const RecycleBinPage(),
  ];
  final List<String> _titles = ['All notes', 'Recycle bin'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          _titles[_selectedIndex],
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: Drawer(
          child: ListView(
        children: [
          ListTile(
              leading: Icon(LineIcons.values['stickyNote']),
              title: const Text("All notes"),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              }),
          ListTile(
            leading: Icon(LineIcons.values['trash']),
            title: const Text("Recycle bin"),
            onTap: () {
              setState(() {
                _selectedIndex = 1;
              });
              Navigator.pop(context);
            },
          )
        ],
      )),
      body: _pages[_selectedIndex],
    );
  }
}
