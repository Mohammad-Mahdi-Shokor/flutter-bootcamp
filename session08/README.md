# Session 08 — To-Do App with Riverpod and Adding Tasks

This session solves the session 7 homework together. The tasks move into a
Riverpod controller, a form at the top lets you add new tasks, and tapping a
task opens its Task Details page.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Add the `lib/` folder to your project directory.
3. Add the `flutter_riverpod` dependency to your `pubspec.yaml` file.
4. Run the following command in your terminal: `flutter pub get`

**What changed since session 7**

`models/task.dart` is unchanged.

- `controllers/taskController.dart` — NEW. `Taskcontroller` owns the tasks.
  `changeStatus()` moved here from the tasks page, and the new `addTask()`
  only adds a task if the title is 2–20 characters and the note is 2–100.
- `controllers/app_controllers.dart` — NEW. `appcontainer` + `taskProvider`.
- `Views/tasks_page.dart` — the biggest change. `StatefulWidget` →
  `ConsumerWidget` that reads from `taskProvider`. Added two `TextField`s
  (title + note) with `TextEditingController`s, an "Add Task" button, and
  `goToDetailsPage()`.
- `Views/task_details.dart` — NEW. Shows a task's title, status, and note.
  Receives the `Task` through its constructor.
- `widgets/task_tile.dart` — moved from `Views/` to a new `widgets/` folder.
  New `goToDetailsPage` callback: tap the tile to open details, tap the icon
  to toggle status.
- `Views/home.dart` — amber `AppBar` and a `debugPrint()`.
- `main.dart` — wrapped in `UncontrolledProviderScope`.

**What we learned**

Moving an existing screen to Riverpod, `TextField` + `TextEditingController`,
`InputDecoration`, validating input in the controller, `debugPrint` vs
`print`, and passing a `Task` to a details page.

**Homework**
Checkout /Homework/README.md for details
