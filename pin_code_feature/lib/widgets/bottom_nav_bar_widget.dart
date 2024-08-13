import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomNavBarWidget extends StatelessWidget {
  final int selectedIndex;
  final ValueChanged<int> onItemTapped;

  const BottomNavBarWidget({
    super.key,
    required this.selectedIndex,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        items: [
          BottomNavigationBarItem(
            icon: selectedIndex == 0
                ? const Icon(Icons.home)
                : const Icon(Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 1
                ? const Icon(Icons.auto_awesome_mosaic)
                : const Icon(Icons.auto_awesome_mosaic_outlined),
            label: 'Discovery',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 2
                ? const Icon(Icons.notifications)
                : const Icon(Icons.notifications_outlined),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: selectedIndex == 3
                ? const Icon(Icons.person_rounded)
                : const Icon(Icons.person_outline_outlined),
            label: 'Me',
          ),
        ],
        selectedLabelStyle: GoogleFonts.notoSansMono(),
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        currentIndex: selectedIndex,
        elevation: 0,
        onTap: onItemTapped,
      ),
    );
  }
}
