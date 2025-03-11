// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables

import 'dart:convert';
import 'package:flutter/material.dart';
import '../components/dialog_box.dart';
import '../components/to_do_tile.dart';
import '../models/tile_model.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // text controller
  final _controller = TextEditingController();
  List toDoList = []; //list of items
  bool isLoading = true; //for manage state

  Future getUsers() async {
    String baseUrl = 'https://randomuser.me/api/?results=10';
    var response = await http.get(Uri.parse(baseUrl));
    var jsonData = jsonDecode(response.body);

    setState(() {
      toDoList.clear();
      for (var eachUser in jsonData["results"]) {
        final user = TileModel(
          taskName: "${eachUser['name']['first']} ${eachUser['name']['last']}",
          taskCompleted: false,
        );

        toDoList.add([
          user.taskName,
          user.taskCompleted,
        ]);
      }

      isLoading = false; // Marque le chargement comme terminé
    });

    print("Nombre de users: ${toDoList.length}");
    print("Corps obtenu: ${response.body}");
  }

  //checkbox was tapped
  void checkBoxChanged(bool? value, int index) {
    setState(() {
      toDoList[index][1] = !toDoList[index][1];
    });
  }

  //save a new task
  void saveNewTask() {
    setState(() {
      if (_controller.text != '\n') {
        toDoList.add([_controller.text, false]);
        _controller.clear();
      }
    });
    Navigator.of(context).pop();
  }

  //create a new task
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

  //delete task
  void deleteTask(int index) {
    setState(() {
      toDoList.removeAt(index);
    });
  }

  @override
  void initState() {
    super.initState();
    getUsers();
  }

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
      floatingActionButton: FloatingActionButton(
        onPressed: createNawTask,
        backgroundColor: Color(0xFF193540),
        child: Icon(
          Icons.add,
          color: Colors.white70,
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator(color: Colors.black))
          : ListView.builder(
              itemCount: toDoList.length,
              itemBuilder: (context, index) => ToDoTile(
                taskName: toDoList[index][0],
                taskCompleted: toDoList[index][1],
                onChanged: (value) => checkBoxChanged(value, index),
                deleteFunction: (context) => deleteTask,
              ),
            ),
    );
  }
}
