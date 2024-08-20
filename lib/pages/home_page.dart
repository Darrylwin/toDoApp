import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../components/dialog_box.dart';
import '../components/to_do_tile.dart';
import '../models/tile_model.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<TileModel> toDoList = [];

  void getList() {
    toDoList = TileModel.getList();
  }

  List toDoList1 = [
    ["Make Tuto", false],
    ["Do smthg", false],
    ["Do smthg", false],
  ];

  // text controller
  final _controller = TextEditingController();

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList1[index][1] = !toDoList1[index][1];
    });
  }

  //save a ew task
  void saveNewTask() {
    setState(() {
      toDoList1.add([_controller.text, false]);
      _controller.clear();
    });
    Navigator.of(context).pop();
  }

  //create new task
  void createNawTask() {
    showDialog(
      context: context,
      builder: (context) {
        return DialogBox(
          controller: _controller,
          onCancel: () => Navigator.of(context).pop(),
          onSave: saveNewTask,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    getList();
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
      floatingActionButton: FloatingActionButton(
        onPressed: createNawTask,
        backgroundColor: Color(0xFF193540),
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return ToDoTile(
            taskName: toDoList1[index][0],
            taskCompleted: toDoList1[index][1],
            onChanged: (value) => checkBoxChanged(value, index),
          );

          // return Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Container(
          //     padding: EdgeInsets.all(12 * 2),
          //     decoration: BoxDecoration(
          //       color: Color(0xFF193540),
          //       borderRadius: BorderRadius.circular(15),
          //     ),
          //     child: Row(
          //       children: [
          //         // checkbox
          //         Checkbox(value: taskCompleted, onChanged: onChanged),

          //         //task
          //         Text(
          //           taskName,
          //           style: TextStyle(
          //             color: Colors.white70,
          //           ),
          //         ),
          //       ],
          //     ),
          //   ),
          // );
        },
        itemCount: toDoList1.length,
      ),
    );
  }
}
