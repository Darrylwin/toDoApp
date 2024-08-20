import 'package:flutter/material.dart';

class ToDoTile extends StatefulWidget {
  const ToDoTile({super.key});

  @override
  State<ToDoTile> createState() => _ToDoTileState();
}

class _ToDoTileState extends State<ToDoTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12*2),
        decoration: BoxDecoration(
          color: Color(0xFF193540),
        ),
        child: Text(
          "Personnalised Text",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
      ),
    );
  }
}
