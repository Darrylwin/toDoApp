// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ToDoTile extends StatelessWidget {
  ToDoTile({
    super.key,
    required this.taskName,
    required this.taskCompleted,
    required this.onChanged,
  });

  final String taskName;

  final bool? taskCompleted;

  void Function(bool?)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12 * 2),
        decoration: BoxDecoration(
          color: Color(0xFF193540),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            // checkbox
            Checkbox(value: taskCompleted, onChanged: onChanged),

            //task
            Text(
              taskName,
              style: TextStyle(
                color: Colors.white70,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
