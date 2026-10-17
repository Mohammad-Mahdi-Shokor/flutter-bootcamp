import 'package:flutter/material.dart';
import 'package:flutter_14_7/models/task.dart';

class Taskcontroller extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: "Buy Groceries", note: "Milk, eggs and bread", status: true),
    Task(title: "Finish Homework", note: "Math Chapter 5", status: false),
    Task(title: "Call Mom", note: "Wish her a happy weekend", status: false),
  ];

  void changeStatus(int index) {
    tasks[index].status = !tasks[index].status!;
    notifyListeners();
  }

  void addTask(String title, String note) {
    //20>= title >=2
    //100>= note >=2
    if (title.length >= 2 &&
        title.length <= 20 &&
        note.length <= 100 &&
        note.length >= 2) {
      tasks.add(Task(title: title, note: note, status: false));
      notifyListeners();
    }
  }
}
