// ===========================================================================
// SESSION 07 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: start the To-Do app that sessions 08–10 keep
// building on. We use everything so far (models, ListView.builder, ListTile,
// setState, named routes) in one small real app, and we split the UI into
// our own reusable widget.
//
// Fresh project this session (the session 05 counter/items/products screens
// are not carried over). There is no session 06 folder in this repo.
//
// Files we actually changed:
//   • models/task.dart        NEW. The Task model: title, note, and status
//                             (done / not done).
//   • Views/tasks_page.dart   NEW. A StatefulWidget that holds the list of
//                             tasks and a changeStatus(index) method that
//                             flips a task between done and not done.
//   • Views/task_tile.dart    NEW. OUR OWN WIDGET: how one task looks. It gets
//                             the Task to show and a function (VoidCallback)
//                             to call when its icon is tapped.
//   • Views/home.dart         NEW. A Home screen with one ElevatedButton that
//                             opens the tasks page.
//   • main.dart (this file)   NEW. MaterialApp with `home` + named routes.
//
// New packages this session: none in the code. Add `flutter_riverpod` anyway:
// the homework moves the tasks page to Riverpod.
//
// What we learned: building a reusable widget with constructor parameters,
// passing a function to a child widget (VoidCallback), ElevatedButton,
// centerTitle, TextDecoration.lineThrough, and choosing an icon or style
// with the ternary operator (condition ? a : b).
// ===========================================================================

import 'package:flutter/material.dart';
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
    // No Riverpod yet: a plain MaterialApp (the homework adds
    // UncontrolledProviderScope here).
    return MaterialApp(
      home: Home(),
      routes: {
        "/home": (context) => const Home(),
        "/tasks": (context) => const TasksPage(),
      },
    );
  }
}
