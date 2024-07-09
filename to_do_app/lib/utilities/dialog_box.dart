import 'package:flutter/material.dart';
import 'package:to_do_app/utilities/my_button.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({
    super.key,
    required this.controller,
    required this.onSave,
    required this.onCancel,
  });

  final dynamic controller;
  final VoidCallback onSave;
  final VoidCallback onCancel;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      contentPadding: const EdgeInsets.all(0),
      content: Container(
        width: 300,
        height: 150,
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.circular(5.0),
          border: Border.all(
            color: Colors.black,
            width: 2,
          ),
        ),
        
        child: Column(
          children: [
            TextField(
              controller: controller,
              maxLines: 2,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                isDense: true,
                contentPadding: EdgeInsets.all(15),
                border: InputBorder.none,
                hintText: "Add a new task..."
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Save button
                MyButton(
                  text: 'Save', 
                  onPressed: onSave,
                  backgroundColor: Colors.blueAccent,
                  textColor: Colors.white,
                ),
                // Cancel button
                MyButton(
                  text: 'Cancel', 
                  onPressed: onCancel,
                  backgroundColor: Colors.white,
                  textColor: Colors.black,
                )
              ],
            )
          ],
        )
      ),
    );
  }
}