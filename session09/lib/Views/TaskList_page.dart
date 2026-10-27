// ===========================================================================
// TaskList_page.dart  —  MAIN CHANGE OF SESSION 09
// ---------------------------------------------------------------------------
// (was Views/tasks_page.dart, class TasksPage)
//
// WHAT CHANGED vs session 08:
//   1. Renamed: file TaskList_page.dart, class TasklistPage. Reads from the
//      renamed tasksProvider.
//   2. NEW: deleteItem(index). Instead of deleting right away, it opens an
//      AlertDialog asking "Delete Task?". Cancel closes the dialog; Delete
//      closes it AND calls deleteTask() on the controller.
//   3. The TextFields look better: a `label` that floats above the field,
//      and an OutlineInputBorder (a box around the field). The whole body
//      gets 16px Padding.
//   4. goToDetailsPage() is gone from this page: the tile now opens the
//      details page itself (see widgets/tasktile.dart).
//   5. The tile gets a new DeleteTask callback.
// ===========================================================================

import 'package:flutter/material.dart';
import '../Controllers/app_controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';
import '../widgets/tasktile.dart'; // RENAMED: was widgets/task_tile.dart

// RENAMED: was TasksPage.
class TasklistPage extends ConsumerWidget {
  const TasklistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasks = ref.watch(tasksProvider).tasks; // CHANGED: tasksProvider

    final Title = TextEditingController();
    final note = TextEditingController();
    // NEW: ask before deleting.
    void deleteItem(int index) {
      // showDialog puts a popup on top of the current page.
      showDialog(
        context: context,
        // `ctx` belongs to the dialog. Navigator.pop(ctx) closes the dialog,
        // not the page.
        builder: (ctx) => AlertDialog(
          // what does it do
          title: Text("Delete Task?"),
          content: Text("This action cannot be undone"),
          actions: [
            // Cancel: just close the dialog.
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Cancel"),
            ),
            // Delete: close the dialog, then delete the task.
            FilledButton(
              onPressed: () {
                Navigator.pop(ctx);
                ref.read(tasksProvider).deleteTask(index);
              },
              child: Text("Delete"),
            ),
          ],
        ),
      );

      // ref.read(tasksProvider).deleteTask(index);   // delete with no dialog
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        backgroundColor: Colors.yellow[200], // CHANGED: was amber
        centerTitle: true,
      ),
      body: Center(
        // NEW: one Padding around everything, instead of one per TextField.
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: Title,
                decoration: InputDecoration(
                  hint: Text("Enter Task Title"),
                  label: Text("Title"), // NEW: floating label
                  border: OutlineInputBorder(), // NEW: box around the field
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: note,
                decoration: InputDecoration(
                  hint: Text("Enter Task note"),
                  label: Text("Note"), // NEW
                  border: OutlineInputBorder(), // NEW
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(tasksProvider).addTask(Title.text, note.text);
                },
                child: Text("Add Task"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Task_Tile(
                      task: tasks[index],
                      changeStatus: () =>
                          ref.read(tasksProvider).changeStatus(index),
                      // NEW: the delete icon in the tile calls this.
                      DeleteTask: () {
                        deleteItem(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
