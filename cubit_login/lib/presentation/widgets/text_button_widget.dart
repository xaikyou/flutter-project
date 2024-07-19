import 'package:flutter/material.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.textButton,
    required this.beginColor,
    required this.endColor,
    required this.size,
    required this.onTap,
  });

  final String textButton;
  final Color beginColor;
  final Color endColor;
  final Size size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              beginColor,
              endColor,
            ],
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        child: FilledButton(
          onPressed: null,
          style: FilledButton.styleFrom(
            minimumSize: size,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Text(
              textButton,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
