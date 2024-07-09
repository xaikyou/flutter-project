import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    super.key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.textColor,
  });

  final String text;
  final VoidCallback onPressed;
  final Color backgroundColor;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(2.0),
        border: Border.all(
          color: Colors.black,
          width: 1,
        ),
      ),
      constraints: const BoxConstraints.tightFor(height: 40, width: 110), 
      child: MaterialButton(
        onPressed: onPressed,
        color: backgroundColor,
        elevation: 0, 
        child: Text(
          text,
          style: TextStyle(
            fontSize: 20,
            color: textColor,
          ),
        ),
        
      ),
    );
  }
}