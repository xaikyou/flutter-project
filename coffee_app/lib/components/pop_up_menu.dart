import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

enum ItemMenu { settings, about }

class _PopUpMenuState extends State<PopUpMenu> {
  ItemMenu? selectedMenu;

  void navigateToPage(ItemMenu item) {
    switch (item) {
      case ItemMenu.settings:
        // Navigate to SettingsPage
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => SettingsPage(),
        // ));
        break;
      case ItemMenu.about:
        // Navigate to AboutPage
        // Navigator.of(context).push(MaterialPageRoute(
        //   builder: (context) => AboutPage(),
        // ));
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ItemMenu>(
      initialValue: null,
      onSelected: (ItemMenu item) {
        setState(() {
          selectedMenu = item;
        });
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ItemMenu>>[
        const PopupMenuItem<ItemMenu>(
          value: ItemMenu.settings,
          child: ListTile(
            leading: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ),
        const PopupMenuItem<ItemMenu>(
          value: ItemMenu.about,
          child: ListTile(
            leading: Icon(Icons.info),
            title: Text('About'),
          ),
        ),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      color: Colors.white,
      elevation: 0,
      offset: const Offset(0, 50),
    );
  }
}
