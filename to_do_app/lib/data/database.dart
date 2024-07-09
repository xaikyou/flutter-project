import 'package:hive_flutter/hive_flutter.dart';

class ToDoDatabase {
  List toDoList = [];

  // Reference our box
  final _mybox = Hive.box('mybox');

  void createInitalData() {
    toDoList = [
      ['What you wanna do today', false]
    ];
  }

  // Load the data
  void loadData() {
    toDoList = _mybox.get("TODOLIST");
  }

  // Updata the database
  void updateDatabase() {
    _mybox.put("TODOLIST", toDoList);
  }
}