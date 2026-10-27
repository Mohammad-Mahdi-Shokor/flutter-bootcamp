// ===========================================================================
// tasktile.dart  —  RENAMED + CHANGED IN SESSION 09
// ---------------------------------------------------------------------------
// (was widgets/task_tile.dart, class TaskTile)
//
// WHAT CHANGED vs session 08:
//   1. Parameter `t` -> `task`. The goToDetailsPage callback is gone: the
//      tile opens TaskdetailsPage itself with Navigator.push. It already has
//      the Task, so it doesn't need the page's help.
//   2. NEW: a DeleteTask callback and a red delete icon.
//   3. `trailing` is now a Row with TWO icons (status + delete).
//      MainAxisSize.min makes the Row only as wide as its icons. Without
//      it, a Row tries to take all the width, which breaks the ListTile.
//   4. The title is bold, and the color is plain Colors.blue.
// ===========================================================================

import 'package:flutter/material.dart';
import '../Views/taskDetails_page.dart'; // NEW: the tile navigates by itself
import '../utils/custom_colors.dart'; // NEW: for CustomColors.red

import '../models/task.dart';

// RENAMED: was TaskTile.
class Task_Tile extends StatelessWidget {
  const Task_Tile({
    super.key,
    required this.task, // RENAMED: was `t`
    required this.changeStatus,
    required this.DeleteTask, // NEW (replaces goToDetailsPage)
  });

  final Task task;
  final VoidCallback changeStatus;
  final VoidCallback DeleteTask;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // CHANGED: was goToDetailsPage(). The tile pushes the page itself.
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return TaskdetailsPage(t: task);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue, // CHANGED: was Colors.blue[300]
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            task.title!,
            style: TextStyle(
              fontWeight: FontWeight.bold, // NEW
              decoration: task.status! ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.note!),
          // CHANGED: one icon -> a Row of two icons.
          trailing: Row(
            mainAxisSize: MainAxisSize.min, // only as wide as the icons
            children: [
              GestureDetector(
                onTap: () {
                  changeStatus();
                },
                child: Icon(
                  task.status!
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                ),
              ),
              SizedBox(width: 10),
              // NEW: delete icon. Calls back to the page, which shows the
              // confirmation dialog.
              GestureDetector(
                onTap: () {
                  DeleteTask();
                },
                child: Icon(Icons.delete, color: CustomColors.red),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.check_circle),
          // ),
          // GestureDetector(child: Icon(Icons.check_circle)),
        ),

        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(children: [Text("Text1"), Text("Text2")]),
        //     Icon(Icons.check_circle),
        //   ],
        // ),
      ),
    );
  }
}
