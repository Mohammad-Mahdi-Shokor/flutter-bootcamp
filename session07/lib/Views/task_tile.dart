// ===========================================================================
// task_tile.dart  —  NEW FILE IN SESSION 07
// ---------------------------------------------------------------------------
// OUR OWN WIDGET: how one task looks in the list. Instead of writing this
// whole Container + ListTile inside ListView.builder, we put it in its own
// class and use it like any Flutter widget:
//
//   TaskTile(t: tasks[index], changeStatus: () { ... })
//
// It takes two things through its constructor:
//   t            -> the Task to show
//   changeStatus -> a FUNCTION to run when the icon is tapped. The tile
//                   doesn't change the task itself: it doesn't own the list.
//                   It just calls the function, and the page that owns the
//                   list (tasks_page.dart) does the work.
//
// VoidCallback = "a function that takes nothing and returns nothing".
// ===========================================================================

import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.t, required this.changeStatus});
  final Task t;
  final VoidCallback changeStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[300],
        borderRadius: BorderRadius.circular(12),
      ),
      child: ListTile(
        title: Text(
          t.title!,
          style: TextStyle(
            // Done tasks get a line through the title. Not done -> null
            // (no decoration).
            decoration: t.status! ? TextDecoration.lineThrough : null,
          ),
        ),
        subtitle: Text(t.note!),
        trailing: GestureDetector(
          onTap: () {
            changeStatus(); // ask the parent page to flip this task
          },
          // Filled check when done, empty circle when not done.
          child: Icon(
            t.status! ? Icons.check_circle : Icons.radio_button_unchecked,
          ),
        ),
      ),
    );
  }
}
