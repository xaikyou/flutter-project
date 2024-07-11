import 'package:coffee_app/theme/theme_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(
      builder: (context, themeProvider, child) => Scaffold(
        backgroundColor: Theme.of(context).colorScheme.surface,
        appBar: AppBar(
          iconTheme:
              IconThemeData(color: Theme.of(context).colorScheme.primary),
          scrolledUnderElevation: 0,
          backgroundColor: Colors.transparent,
          title: Text(
            "Settings Page",
            style: TextStyle(color: Theme.of(context).colorScheme.primary),
          ),
        ),
        body: Container(
          decoration: BoxDecoration(
            color: Colors.white70,
            borderRadius: BorderRadius.circular(15.0),
          ),
          margin: const EdgeInsets.only(top: 15, left: 15, right: 15),
          padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Dark Mode',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              CupertinoSwitch(
                value: themeProvider.isDarkMode,
                onChanged: (value) => themeProvider.toggleTheme(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
