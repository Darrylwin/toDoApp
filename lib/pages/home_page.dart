import 'package:flutter/material.dart';

import '../components/to_do_tile.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF436573),
      appBar: AppBar(
        backgroundColor: Color(
          0xFF193540,
        ),
        title: Text(
          "TO DO APP",
          style: TextStyle(
            color: Colors.white70,
          ),
        ),
        elevation: 0,
        centerTitle: true,
      ),
      body: ListView(
        children: [
          ToDoTile(),
        ],
      ),
    );
  }
}
