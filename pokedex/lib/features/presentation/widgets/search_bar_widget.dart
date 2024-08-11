import 'package:flutter/material.dart';
import 'package:pokedex/config/constants.dart';

class SearchBarWidget extends StatelessWidget {
  const SearchBarWidget({super.key, required this.controller});

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      textInputAction: TextInputAction.go,
      onFieldSubmitted: (value) {},
      maxLength: null,
      decoration: InputDecoration(
        fillColor: whiteColor,
        filled: true,
        prefixIcon: GestureDetector(
          onTap: () => {},
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 10),
            child: Icon(
              Icons.search,
              color: Colors.red.shade700,
            ),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
          borderSide: BorderSide.none,
        ),
        hintText: "Search",
      ),
      style: const TextStyle(fontSize: 20),
    );
  }
}
