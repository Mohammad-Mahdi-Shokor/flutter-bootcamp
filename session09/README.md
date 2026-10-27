# Session 09 — Deleting Tasks and Cleaning Up

This session lets you delete a task, with a confirmation dialog first. It also
improves the add-task form and adds a `utils/` folder so colors and text sizes
are defined once and reused. Several files and classes were renamed to a
cleaner naming style.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Add the `lib/` folder to your project directory.
3. Add the `flutter_riverpod` dependency to your `pubspec.yaml` file.
4. Run the following command in your terminal: `flutter pub get`

**What changed since session 8**

`models/task.dart` is unchanged.

- `Controllers/task_controller.dart` — renamed from
  `controllers/taskController.dart` (`Taskcontroller` → `TaskController`).
  The list is now private (`_tasks`) with a getter, and there's a new
  `deleteTask(index)`.
- `Controllers/app_controllers.dart` — `taskProvider` → `tasksProvider`.
- `Views/TaskList_page.dart` — renamed from `Views/tasks_page.dart`
  (`TasksPage` → `TasklistPage`). The `TextField`s have a `label` and an
  `OutlineInputBorder`. The new `deleteItem()` shows an `AlertDialog` before
  deleting.
- `widgets/tasktile.dart` — renamed from `widgets/task_tile.dart`
  (`TaskTile` → `Task_Tile`). It opens the details page by itself and has a
  new red delete icon next to the status icon.
- `Views/taskDetails_page.dart` — renamed from `Views/task_details.dart`
  (`TaskDetails` → `TaskdetailsPage`). Uses a `ListView` so it can scroll,
  with font sizes from `CustomTextSize`.
- `Views/home_page.dart` — renamed from `Views/home.dart` (`Home` →
  `HomePage`). Yellow `AppBar`.
- `utils/` — NEW folder: `custom_colors.dart` (app colors),
  `custom_text_size.dart` (font sizes relative to screen height), and
  `hexColor/hex_color.dart` (turns `"#F44336"` into a `Color`).
- `main.dart` — uses the renamed pages and hides the DEBUG banner.

**What we learned**

Deleting from a list safely (`removeAt` with an index check), `showDialog` +
`AlertDialog` (`TextButton`, `FilledButton`, closing it with
`Navigator.pop`), `InputDecoration` `label` + `OutlineInputBorder`, a `Row`
with `MainAxisSize.min` inside a `ListTile`, private fields + getters, and
keeping colors and sizes in a `utils/` folder.

**Session 8 homework solution**

See `Homework-08-Solution/`.
