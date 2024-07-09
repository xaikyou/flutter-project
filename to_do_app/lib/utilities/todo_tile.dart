import 'package:flutter/material.dart';

class TodoTile extends StatelessWidget {
  const TodoTile({
    super.key, 
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
    required this.deleteFunction,
  });

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;
  final VoidCallback deleteFunction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0),
      child: Stack(
        clipBehavior: Clip.none, // Allow items to overflow the stack
        children: [
          Container(
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: Colors.white, 
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(
                color: Colors.black,
                width: 1.5,
              ),
            ),

            child: Row(
              children: [
                // checkbox
                Checkbox(
                  value: taskCompleted, 
                  onChanged: onChanged,
                  activeColor: Colors.blueAccent,
                ),
          
                // task name
                Text(
                  taskName,
                  style: TextStyle(
                    fontSize: 20,
                    decoration: taskCompleted 
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  ),
                )
              ],
            ),
          ),
          if (taskCompleted) 
            Positioned(
              top: -10,
              right: -10,
              child: GestureDetector(
                onTap: deleteFunction,
                child: Container(
                  width: 30,
                  height: 30,
                  decoration: const BoxDecoration(
                    color: Colors.red,
                    shape: BoxShape.circle,
                  ),
                  child: Transform.scale(
                    scale: 0.8,
                    child: const Icon(
                      Icons.close,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            )
        ],
      ),
    );
  }
}