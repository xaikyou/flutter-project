import 'package:coffee_app/components/bottom_nav_bar.dart';
import 'package:coffee_app/components/pop_up_menu.dart';
import 'package:coffee_app/pages/cart_page.dart';
import 'package:coffee_app/pages/shop_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      appBar: AppBar(
        // keep color of appbar same when scrolling down
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: Theme.of(context).colorScheme.primary),
        elevation: 0,
        title: Text(
          "Coffee On Road",
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const PopUpMenu(),
          ),
        ],
      ),
      drawer: Drawer(
        child: Center(
            child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            'Wish you a lucky day with Flutter.\nFrom 10/7/2024',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        )),
      ),
      bottomNavigationBar: BottomNavBar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
