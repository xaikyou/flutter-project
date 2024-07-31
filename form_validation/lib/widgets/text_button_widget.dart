import 'package:flutter/material.dart';
import 'package:form_validation/config/constants.dart';

class TextButtonWidget extends StatelessWidget {
  const TextButtonWidget({
    super.key,
    required this.textButton,
    required this.color,
    required this.size,
    required this.onPressed,
  });

  final String textButton;
  final Color color;
  final Size size;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return FilledButton(
      onPressed: onPressed,
      style: FilledButton.styleFrom(
        minimumSize: size,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        backgroundColor: color,
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Text(
          textButton,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: normalSize,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
