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
      backgroundColor: const Color.fromARGB(255, 248, 244, 225),
      appBar: AppBar(
        // keep color of appbar same when scrolling down
        scrolledUnderElevation: 0,
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: const Text(
          "Coffee On Road",
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const PopUpMenu()),
        ],
      ),
      drawer: const Drawer(
        child: Center(
            child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Text(
            'Wish you a lucky day with Flutter.\nFrom 10/7/2024',
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
