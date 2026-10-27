// ===========================================================================
// SESSION 09 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: clean up and grow the To-Do app. We can now DELETE
// a task (with a confirmation dialog), the form looks better, and we add a
// utils/ folder so colors and text sizes are defined once and reused.
// Several files and classes were renamed to a cleaner naming style.
//
// Files we actually changed (models/task.dart is the same as session 08):
//   • Controllers/task_controller.dart RENAMED + CHANGED (was
//                             controllers/taskController.dart, class
//                             Taskcontroller -> TaskController). The list is
//                             now private (_tasks) with a getter, and there
//                             is a NEW deleteTask(index).
//   • Controllers/app_controllers.dart CHANGED: taskProvider ->
//                             tasksProvider, pointing at TaskController.
//   • Views/TaskList_page.dart RENAMED + CHANGED (was Views/tasks_page.dart,
//                             TasksPage -> TasklistPage). TextFields gained a
//                             label and an OutlineInputBorder. NEW
//                             deleteItem() shows an AlertDialog before
//                             deleting. Navigation to details moved into the
//                             tile.
//   • widgets/tasktile.dart   RENAMED + CHANGED (was widgets/task_tile.dart,
//                             TaskTile -> Task_Tile). Opens the details page
//                             by itself, and has a NEW delete icon next to
//                             the status icon.
//   • Views/taskDetails_page.dart RENAMED + CHANGED (was
//                             Views/task_details.dart, TaskDetails ->
//                             TaskdetailsPage). Column -> ListView (scrolls
//                             if the note is long), and font sizes come from
//                             CustomTextSize.
//   • Views/home_page.dart    RENAMED (was Views/home.dart, Home ->
//                             HomePage). AppBar is yellow now.
//   • utils/                  NEW folder:
//       - custom_colors.dart       app colors in one place (CustomColors.red)
//       - custom_text_size.dart    font sizes relative to the screen height
//       - hexColor/hex_color.dart  turns "#F44336" into a Flutter Color
//   • main.dart (this file)   CHANGED: uses the renamed HomePage and
//                             TasklistPage, and hides the DEBUG banner.
//
// New packages this session: none (flutter_riverpod from session 08).
//
// What we learned: deleting from a list (removeAt) safely, showDialog +
// AlertDialog (TextButton / FilledButton, Navigator.pop to close it),
// InputDecoration label + OutlineInputBorder, Row with
// MainAxisSize.min, private fields + getters, and keeping colors and sizes
// in a utils/ folder.
// ===========================================================================

import 'package:flutter/material.dart';
import 'Controllers/app_controllers.dart'; // CHANGED: folder is now Controllers/
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Views/TaskList_page.dart'; // RENAMED: was Views/tasks_page.dart
import 'Views/home_page.dart'; // RENAMED: was Views/home.dart

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: appcontainer,
      child: MaterialApp(
        debugShowCheckedModeBanner: false, // NEW: hide the DEBUG ribbon
        home: HomePage(), // CHANGED: was Home()
        routes: {
          "/home": (context) => const HomePage(), // CHANGED: was Home()
          "/tasks": (context) => const TasklistPage(), // CHANGED: was TasksPage()
        },
      ),
    );
  }
}
