// ===========================================================================
// tasks_page.dart  —  NEW FILE IN SESSION 07
// ---------------------------------------------------------------------------
// The list of tasks. This page OWNS the data:
//   • `tasks`              -> the list of Task objects
//   • changeStatus(index)  -> flips one task's status, inside setState()
//
// For each task, ListView.builder creates a TaskTile and gives it a small
// function: () { changeStatus(index); }. When the tile's icon is tapped, it
// calls that function, the page runs setState(), and the list redraws.
//
// It's a StatefulWidget (the session 02 way) for now. The homework moves
// the tasks into a Riverpod controller.
// ===========================================================================

import 'package:flutter/material.dart';
import 'task_tile.dart';

import '../models/task.dart';

class TasksPage extends StatefulWidget {
  const TasksPage({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  // The data: a List of our Task model (like products in session 05).
  List<Task> tasks = [
    Task(title: "Buy Groceries", note: "Milk, eggs and bread", status: true),
    Task(title: "Finish Homework", note: "Math Chapter 5", status: false),
    Task(title: "Call Mom", note: "Wish her a happy weekend", status: false),
  ];
  // true -> false, false -> true. `!` before a bool means "not".
  void changeStatus(int index) {
    setState(() {
      tasks[index].status = !tasks[index].status!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Tasks"), centerTitle: true),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            // Our own widget, used like any built-in one.
            return TaskTile(
              t: tasks[index],
              // Passing a function down: the tile calls it, this page
              // does the work.
              changeStatus: () {
                changeStatus(index);
              },
            );
          },
        ),
      ),
    );
  }
}
