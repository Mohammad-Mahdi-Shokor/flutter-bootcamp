// ===========================================================================
// SESSION 04 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: state management with Riverpod. Until now, data
// lived inside a StatefulWidget and only that screen could use it. Now we put
// the counter in a CONTROLLER that lives outside the widgets, so any screen
// can read it, and the counter keeps its value when you leave the page and
// come back.
//
// Fresh project this session (the session 03 screens are not carried over),
// but the named routes from session 03 are back, this time with a Home menu.
//
// Files we actually changed:
//   • Controllers/counter_controller.dart NEW. CounterController extends
//                             ChangeNotifier: it holds _counter and its
//                             addCounter() calls notifyListeners().
//   • Controllers/app_controllers.dart    NEW. The Riverpod wiring: one
//                             ProviderContainer (appContainer) and one
//                             ChangeNotifierProvider (counterProvider).
//   • Views/counter.dart      NEW. The counter screen as a ConsumerWidget:
//                             ref.watch() to show the value, ref.read() to
//                             increment it.
//   • Views/itemsPage.dart    NEW. Pick one item from a list. Still the
//                             session 02 way (StatefulWidget + setState), so
//                             we can compare it with the Riverpod counter.
//                             (Session 05 moves it to Riverpod.)
//   • Views/home.dart         NEW. A menu with one button per page
//                             (Navigator.pushNamed).
//   • main.dart (this file)   NEW. Wraps the app in UncontrolledProviderScope
//                             and defines the routes.
//
// New package this session: add `flutter_riverpod` to pubspec.yaml, then
// `flutter pub get`.
//
// What we learned: why state needs to live outside widgets, ChangeNotifier +
// notifyListeners(), ChangeNotifierProvider, ProviderContainer,
// UncontrolledProviderScope, ConsumerWidget, ref.watch vs ref.read, and
// highlighting the selected item in a ListView.builder.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // NEW: Riverpod
import 'Controllers/app_controllers.dart'; // NEW: our providers + appContainer
import 'Views/counter.dart';
import 'Views/home.dart';
import 'Views/itemsPage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // NEW: UncontrolledProviderScope connects Riverpod to the app. Every
    // widget below it can now reach the providers stored in appContainer.
    // Without it, ref.watch() / ref.read() throw an error.
    return UncontrolledProviderScope(
      container: appContainer,
      child: MaterialApp(
        home: Home(), // the menu screen
        // Named routes, like session 03. The names must match the ones used
        // in Navigator.pushNamed() inside home.dart.
        routes: {
          "/home": (ctx) => const Home(),
          "/counter": (ctx) => const counterScreen(),
          "/items": (ctx) => const Itemspage(),
        },
      ),
    );
  }
}
