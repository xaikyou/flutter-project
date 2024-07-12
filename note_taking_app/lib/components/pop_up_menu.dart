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
      initialValue: null,
      onSelected: (ItemMenu item) {
        setState(() {
          selectedMenu = item;
        });
        navigateToPage(item);
      },
      itemBuilder: (BuildContext context) => <PopupMenuEntry<ItemMenu>>[
        const PopupMenuItem<ItemMenu>(
            value: ItemMenu.edit, child: Text('Edit')),
        const PopupMenuItem<ItemMenu>(
            value: ItemMenu.view, child: Text('View')),
      ],
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      elevation: 0,
      // offset: const Offset(0, 50),
    );
  }
}
