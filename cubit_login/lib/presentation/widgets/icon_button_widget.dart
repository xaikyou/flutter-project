import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.iconButton,
    required this.size,
    required this.onTap,
  });

  final String iconButton;
  final Size size;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: ElevatedButton(
        onPressed: onTap,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all<Color>(Colors.white),
          minimumSize: WidgetStateProperty.all<Size>(size),
          shape: WidgetStateProperty.all<OutlinedBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
              side: const BorderSide(
                color: Colors.black,
                width: 1,
              ),
            ),
          ),
        ),
        child: Image.asset(
          iconButton,
          width: 35,
          height: 35,
        ),
      ),
    );
  }
}
