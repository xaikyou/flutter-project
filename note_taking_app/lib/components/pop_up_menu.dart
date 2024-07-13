import 'package:flutter/material.dart';

class PopUpMenu extends StatefulWidget {
  const PopUpMenu({super.key});

  @override
  State<PopUpMenu> createState() => _PopUpMenuState();
}

enum ItemMenu { edit, view }

class _PopUpMenuState extends State<PopUpMenu> {
  ItemMenu? selectedMenu;

  void navigateToPage(ItemMenu item) {
    switch (item) {
      case ItemMenu.edit:
        break;
      case ItemMenu.view:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton<ItemMenu>(
      color: Theme.of(context).colorScheme.surface,
      initialValue: null,
      onSelected: (ItemMenu item) {
        setState(() {
          selectedMenu = item;
        });
        navigateToPage(item);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ItemMenu>>[
        PopupMenuItem<ItemMenu>(
            value: ItemMenu.edit,
            child: Text(
              'Edit',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )),
        PopupMenuItem<ItemMenu>(
            value: ItemMenu.view,
            child: Text(
              'View',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )),
        PopupMenuItem<ItemMenu>(
            value: ItemMenu.view,
            onTap: () {
              Navigator.pushNamed(context, '/settingspage');
            },
            child: Text(
              'Settings',
              style: TextStyle(color: Theme.of(context).colorScheme.primary),
            )),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 3,
      shadowColor: Colors.black26,
      child:
          Icon(Icons.more_vert, color: Theme.of(context).colorScheme.primary),
      // offset: const Offset(0, 50),
    );
  }
}
