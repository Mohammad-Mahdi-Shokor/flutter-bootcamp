// ===========================================================================
// tasks_page.dart  —  MAIN CHANGE OF SESSION 08
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 07:
//   1. StatefulWidget -> ConsumerWidget. The tasks list and changeStatus()
//      moved to Taskcontroller. This page now reads them with
//      ref.watch(taskProvider).
//   2. NEW: an "add task" form at the top: two TextFields (title + note),
//      each with its own TextEditingController, and an "Add Task" button
//      that calls addTask() on the controller.
//   3. NEW: goToDetailsPage(task) opens TaskDetails with Navigator.push and
//      passes it the Task (same as products in session 05).
//   4. The body is now a Column (form on top, list below), so the
//      ListView.builder is wrapped in Expanded.
//   5. TaskTile moved to widgets/ and gets one more callback.
// ===========================================================================

import 'package:flutter/material.dart';
import 'task_details.dart'; // NEW
import '../controllers/app_controllers.dart'; // NEW
import 'package:flutter_riverpod/flutter_riverpod.dart'; // NEW

import '../widgets/task_tile.dart'; // CHANGED: was Views/task_tile.dart

import '../models/task.dart';

// CHANGED: was `class TasksPage extends StatefulWidget`.
class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // NEW: the list comes from the controller. watch -> rebuild when a task
    // is added or its status changes.
    List<Task> tasks = ref.watch(taskProvider).tasks;
    // NEW: a TextEditingController lets us read what was typed (.text).
    // Created inside build(), so a new, empty one is made on every rebuild.
    // That's why both fields clear after a task is added.
    final titleController = TextEditingController();
    final noteController = TextEditingController();
    // CHANGED: no more setState; we ask the controller to do it.
    void changeStatus(int index) {
      ref.read(taskProvider).changeStatus(index);
    }

    // NEW: open the details page for one task, passing it through the
    // constructor.
    void goToDetailsPage(Task t) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return TaskDetails(t: t);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        centerTitle: true,
        backgroundColor: Colors.amber[200], // NEW: amber theme
      ),
      body: Center(
        child: Column(
          children: [
            // --- NEW: the add-task form ------------------------------------
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(hint: Text("Enter Task Title")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: noteController,
                decoration: InputDecoration(hint: Text("Enter Task Note")),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Send what was typed to the controller. It decides whether
                // the input is valid.
                ref
                    .read(taskProvider)
                    .addTask(titleController.text, noteController.text);
              },
              child: Text("Add Task"),
            ),
            SizedBox(height: 20),
            // --- The list (same as session 07, now inside Expanded) --------
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskTile(
                    t: tasks[index],
                    changeStatus: () {
                      changeStatus(index);
                    },
                    // NEW: second callback -> open this task's details.
                    goToDetailsPage: () {
                      goToDetailsPage(tasks[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
