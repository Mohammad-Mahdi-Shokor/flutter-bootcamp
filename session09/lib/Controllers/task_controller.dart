// ===========================================================================
// task_controller.dart  —  RENAMED + CHANGED IN SESSION 09
// ---------------------------------------------------------------------------
// (was controllers/taskController.dart, class Taskcontroller)
//
// WHAT CHANGED vs session 08:
//   1. File and class renamed: snake_case file name, PascalCase class name
//      (the Dart naming style).
//   2. The list is now PRIVATE (_tasks) with a public getter. Screens can
//      read the tasks but can't add or remove them directly. They have to
//      call addTask() / deleteTask(), so the rules here always apply.
//      Same idea as _counter in session 04.
//   3. NEW: deleteTask(index).
//   4. Different starting tasks (just sample data).
// changeStatus() and addTask() work the same as in session 08.
// ===========================================================================

import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskController extends ChangeNotifier {
  // CHANGED: private + final. `final` means the variable always points to
  // the same list; we can still add to it and remove from it.
  final List<Task> _tasks = [
    Task(
      title: "Buy groceries",
      note: "apple, bannana and eggs",
      status: false,
    ),
    Task(title: "Finish Homework", note: "Math Chapter 6", status: true),
    Task(title: "Call Mom", note: "Wish her a happy weekend", status: true),
  ];
  List<Task> get tasks => _tasks; // NEW: read-only access for the screens
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

  // NEW: remove one task. The `if` makes sure the index exists first:
  // removeAt() with a bad index would crash the app (RangeError).
  void deleteTask(int index) {
    if (index >= 0 && index < _tasks.length) {
      _tasks.removeAt(index);
      notifyListeners();
    }
  }
}
