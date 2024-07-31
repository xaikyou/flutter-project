import 'package:flutter/material.dart';

class IconButtonWidget extends StatelessWidget {
  const IconButtonWidget({
    super.key,
    required this.onPressedFunc,
    required this.icon,
  });

  final Function() onPressedFunc;
  final Icon icon;

  @override
  Widget build(BuildContext context) {
    return FilledButton.icon(
      onPressed: onPressedFunc,
      style: FilledButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(20),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      label: icon,
    );
  }
}
