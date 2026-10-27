// ===========================================================================
// SESSION 08 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: the session 07 homework, solved together. The To-Do
// app moves to Riverpod, gets a form to ADD tasks (TextField), and tapping a
// task opens a Task Details page.
//
// Files we actually changed (models/task.dart is the same as session 07):
//   • controllers/taskController.dart NEW. Taskcontroller (ChangeNotifier)
//                             now owns the tasks list. changeStatus() moved
//                             here from tasks_page, and addTask() is new:
//                             it only adds a task if title and note have
//                             valid lengths.
//   • controllers/app_controllers.dart NEW. appcontainer + taskProvider.
//   • Views/tasks_page.dart   CHANGED the most. StatefulWidget ->
//                             ConsumerWidget that reads the tasks from
//                             taskProvider. Added two TextFields (title +
//                             note) with TextEditingControllers, an
//                             "Add Task" button, and goToDetailsPage().
//   • Views/task_details.dart NEW. Shows one task's title, status and note.
//                             Receives the Task through its constructor.
//   • widgets/task_tile.dart  MOVED from Views/ to a new widgets/ folder
//                             (reusable pieces go in widgets/, full screens
//                             in Views/). CHANGED: new goToDetailsPage
//                             callback; tapping the tile opens details,
//                             tapping the icon still toggles status.
//   • Views/home.dart         CHANGED: amber AppBar + a debugPrint().
//   • main.dart (this file)   CHANGED: wrapped in UncontrolledProviderScope.
//
// New package this session: add `flutter_riverpod` to pubspec.yaml, then
// `flutter pub get`.
//
// What we learned: moving an existing screen to Riverpod, TextField +
// TextEditingController, InputDecoration (hint), validating input in the
// controller, debugPrint vs print, and passing a Task to a details page.
// ===========================================================================

import 'package:flutter/material.dart';
import 'controllers/app_controllers.dart'; // NEW: appcontainer + taskProvider
import 'package:flutter_riverpod/flutter_riverpod.dart'; // NEW: Riverpod

import 'Views/home.dart';
import 'Views/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // CHANGED: the MaterialApp is now wrapped in UncontrolledProviderScope,
    // so every screen can use taskProvider. The routes are the same.
    return UncontrolledProviderScope(
      container: appcontainer,
      child: MaterialApp(
        home: Home(),
        routes: {
          "/home": (context) => const Home(),
          "/tasks": (context) => const TasksPage(),
        },
      ),
    );
  }
}
