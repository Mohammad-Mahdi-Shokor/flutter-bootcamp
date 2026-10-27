// ===========================================================================
// taskController.dart  —  NEW FILE IN SESSION 08
// ---------------------------------------------------------------------------
// The tasks data, moved out of tasks_page.dart:
//   • `tasks`          -> same three starting tasks as session 07.
//   • changeStatus()   -> MOVED here from tasks_page. setState() became
//                         notifyListeners().
//   • addTask()        -> NEW. Adds a task, but only if the input is valid.
//                         Checking the input belongs in the controller,
//                         not the UI, so every screen gets the same rules.
// ===========================================================================

import 'package:flutter/material.dart';
import '../models/task.dart';

class Taskcontroller extends ChangeNotifier {
  List<Task> tasks = [
    Task(title: "Buy Groceries", note: "Milk, eggs and bread", status: true),
    Task(title: "Finish Homework", note: "Math Chapter 5", status: false),
    Task(title: "Call Mom", note: "Wish her a happy weekend", status: false),
  ];

  // MOVED from tasks_page.dart (session 07).
  void changeStatus(int index) {
    tasks[index].status = !tasks[index].status!;
    notifyListeners();
  }

  // NEW: called by the "Add Task" button.
  void addTask(String title, String note) {
    //20>= title >=2
    //100>= note >=2
    if (title.length >= 2 &&
        title.length <= 20 &&
        note.length <= 100 &&
        note.length >= 2) {
      // New tasks always start as not done.
      tasks.add(Task(title: title, note: note, status: false));
      notifyListeners();
    }
    // Invalid input -> nothing happens (no task added, no rebuild).
  }
}
