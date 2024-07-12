import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';
import 'package:note_taking_app/components/pop_up_menu.dart';
import 'package:note_taking_app/pages/all_notes_page.dart';
import 'package:note_taking_app/pages/recycle_bin_page.dart';
import 'package:note_taking_app/pages/settings_page.dart';

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
    const SettingsPage(),
  ];
  final List<String> _titles = ['All notes', 'Recycle bin', 'Settings'];

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
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: const PopUpMenu()),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              leading: const Icon(LineIcons.stickyNote),
              title: Text(
                "All notes",
                style: TextStyle(
                  fontWeight:
                      _selectedIndex == 0 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              tileColor: _selectedIndex == 0 ? Colors.grey[200] : null,
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(LineIcons.trash),
              title: Text(
                "Recycle bin",
                style: TextStyle(
                  fontWeight:
                      _selectedIndex == 1 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              tileColor: _selectedIndex == 1 ? Colors.grey[200] : null,
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: const Icon(LineIcons.cog),
              title: Text(
                "Settings",
                style: TextStyle(
                  fontWeight:
                      _selectedIndex == 2 ? FontWeight.bold : FontWeight.normal,
                ),
              ),
              tileColor: _selectedIndex == 2 ? Colors.grey[200] : null,
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          Expanded(
            child: _pages[_selectedIndex],
          ),
        ],
      ),
    );
  }
}
