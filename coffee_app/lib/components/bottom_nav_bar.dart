import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({
    super.key,
    required this.onTabChange,
  });

  final void Function(int)? onTabChange;

  @override
  Widget build(BuildContext context) {
    return GNav(
      mainAxisAlignment: MainAxisAlignment.center,
      color: Theme.of(context).colorScheme.onPrimary,
      activeColor: Theme.of(context).colorScheme.onSecondary,
      tabActiveBorder: Border.all(
          color: Theme.of(context).colorScheme.onSecondary, width: 3),
      tabBackgroundColor: Colors.transparent,
      tabBorderRadius: 15,
      onTabChange: (value) => onTabChange!(value),
      tabs: const [
        GButton(
          icon: Icons.home,
          text: 'Shop',
        ),
        GButton(
          icon: Icons.shopping_cart,
          text: 'Cart',
        ),
      ],
    );
  }
}
