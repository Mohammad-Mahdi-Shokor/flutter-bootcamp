# Session 07 — Starting the To-Do App

This session starts the To-Do app that sessions 8–10 keep building on. It
puts what we've learned so far into one small app: a `Task` model, a list of
tasks, tapping a task's icon to mark it done, and our first reusable widget,
`TaskTile`.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Add the `lib/` folder to your project directory.
3. Add the `flutter_riverpod` dependency to your `pubspec.yaml` file.
4. Run the following command in your terminal: `flutter pub get`

The session code doesn't use Riverpod yet. You'll need it for the homework.

**What changed since session 5**

This is a fresh project; the counter, items, and products screens aren't
carried over. (There's no session 6 folder in this repo.)

- `models/task.dart` — NEW. The `Task` model: `title`, `note`, `status`.
- `Views/tasks_page.dart` — NEW. A `StatefulWidget` that holds the tasks and
  a `changeStatus(index)` method (inside `setState()`).
- `Views/task_tile.dart` — NEW. Our own widget for one task. It gets the
  `Task` to show and a `VoidCallback` to call when its icon is tapped. Done
  tasks are crossed out.
- `Views/home.dart` — NEW. One `ElevatedButton` that opens the tasks page.
- `main.dart` — NEW. `MaterialApp` with `home` and named routes.

**What we learned**

Building a reusable widget with constructor parameters, passing a function to
a child widget (`VoidCallback`), `ElevatedButton`, `centerTitle`,
`TextDecoration.lineThrough`, and picking an icon or style with the ternary
operator (`condition ? a : b`).

**Homework for Session 8:**

* Implement Riverpod for state management on the Tasks page.
* Create a **Task Details** page. Set up navigation from the Tasks page to this new page, ensuring that the relevant task data is passed along. *(For reference, please check the provided `tasks_details_screenshot`).*
