// ===========================================================================
// app_controllers.dart  —  CHANGED IN SESSION 09
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 08:
//   • The folder is now Controllers/ (capital C) to match Views/.
//   • taskProvider -> tasksProvider, and it creates the renamed
//     TaskController (was Taskcontroller).
// Same pattern as before: one container, one provider per controller.
// ===========================================================================

import 'task_controller.dart'; // RENAMED: was taskController.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_riverpod/legacy.dart';

ProviderContainer appcontainer = ProviderContainer();

// RENAMED: was `taskProvider` / `Taskcontroller`.
final tasksProvider = ChangeNotifierProvider<TaskController>((ref) {
  return TaskController();
});
