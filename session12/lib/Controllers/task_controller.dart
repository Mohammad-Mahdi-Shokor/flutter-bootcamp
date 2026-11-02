import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskController extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(
      title: "Buy groceries",
      note: "apple, bannana and eggs",
      status: false,
    ),
    Task(title: "Finish Homework", note: "Math Chapter 6", status: true),
    Task(title: "Call Mom", note: "Wish her a happy weekend", status: true),
  ];
  List<Task> get tasks => _tasks;
  void changeStatus(int index) {
    _tasks[index].status = !_tasks[index].status!;
    notifyListeners();
  }

  void addTask(String title, String note) {
    // length between 2 and 100
    if (title.length >= 2 &&
        title.length <= 20 &&
        note.length >= 2 &&
        note.length <= 100) {
      _tasks.add(Task(title: title, note: note, status: false));
      notifyListeners();
    }
  }

  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }
}
