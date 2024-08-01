import 'package:flutter/material.dart';
import 'package:form_validation/config/constants.dart';
import 'dart:math' as math;

class DisplayBubbleWidget extends StatelessWidget {
  final List<String> items;
  final int maxVisibleItems;

  const DisplayBubbleWidget({
    super.key,
    required this.items,
    required this.maxVisibleItems,
  });

  @override
  Widget build(BuildContext context) {
    List<Widget> textWidgets = [];

    for (int i = 0; i < items.length; i++) {
      if (i < maxVisibleItems) {
        textWidgets.add(
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Container(
              margin: const EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black, width: 1),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  CircleAvatar(
                    backgroundColor:
                        Color((math.Random().nextDouble() * 0xFFFFFF).toInt())
                            .withOpacity(0.5),
                    radius: 20,
                  ),
                  Center(
                    child: Text(
                      items[i][0].toUpperCase(),
                      style: const TextStyle(
                        fontSize: normalSize,
                        color: Colors.black,
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      } else if (i == maxVisibleItems) {
        textWidgets.add(
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.0),
            child: Text('...', style: TextStyle(fontSize: normalSize)),
          ),
        );
        break;
      }
    }

    return Row(
      children: textWidgets,
    );
  }
}
