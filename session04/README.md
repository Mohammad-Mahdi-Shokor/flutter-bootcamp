# Session 04 — State Management with Riverpod

This session moves data out of the widgets. The counter now lives in a
controller that any screen can reach through Riverpod, and it keeps its value
when you leave the page and come back. The items page stays on `setState` so
you can compare the two approaches.

**Project Setup Instructions:**

1. Create a new Flutter project.
2. Replace the `lib/` folder in your project with the `lib/` folder from this session.
3. Add the `flutter_riverpod` dependency: `flutter pub add flutter_riverpod`
   (version 3 or newer, since the code imports `flutter_riverpod/legacy.dart`).
4. Run the following command in your terminal: `flutter pub get`

**What changed since session 3**

This is a fresh project, but the named routes from session 3 are back, now
behind a Home menu.

- `Controllers/counter_controller.dart` — NEW. `CounterController` extends
  `ChangeNotifier`: a private `_counter`, a getter, and `addCounter()`, which
  calls `notifyListeners()`.
- `Controllers/app_controllers.dart` — NEW. The Riverpod wiring: one
  `ProviderContainer` (`appContainer`) and `counterProvider`.
- `Views/counter.dart` — NEW. The counter screen as a `ConsumerWidget`:
  `ref.watch()` to show the value, `ref.read()` to increment it.
- `Views/itemsPage.dart` — NEW. Tap an item to select it (green border).
  Still a `StatefulWidget` + `setState()`; session 5 moves it to Riverpod.
- `Views/home.dart` — NEW. A menu with one button per page
  (`Navigator.pushNamed`).
- `main.dart` — NEW. Wraps the app in `UncontrolledProviderScope` and
  defines the routes.

**What we learned**

Why state should live outside widgets, `ChangeNotifier` +
`notifyListeners()`, `ChangeNotifierProvider`, `ProviderContainer`,
`UncontrolledProviderScope`, `ConsumerWidget`, `ref.watch` vs `ref.read`,
`IconButton`, and showing a different widget for the selected item in a
`ListView.builder`.
