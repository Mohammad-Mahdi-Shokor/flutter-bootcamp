// ===========================================================================
// SESSION 10 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: calling a REST API. We added one feature — a random
// motivational quote fetched from the internet and shown above the task list.
//
// Files we actually changed (everything else is the same as session 9):
//   • models/quote.dart       NEW. The data model for a quote, with a
//                             fromMapToQuote() factory that converts the
//                             server's JSON map into a typed Dart object.
//   • Views/TaskList_page.dart CHANGED the most. Became a ConsumerStatefulWidget
//                             and gained fetchQuote() (GET -> check status ->
//                             jsonDecode -> QuoteModel) plus a banner that shows
//                             a loading spinner / the quote / an error. Also
//                             renamed TasklistPage -> TaskListPage.
//   • main.dart (this file)   CHANGED: imports quote.dart and points the
//                             "/tasks" route at the renamed TaskListPage.
//
// New package this session: add `http` to pubspec.yaml, then `flutter pub get`.
//
// What we learned: async/await, the http package, HTTP status codes,
// turning JSON into a model (fromMap), and driving the UI from
// loading/error/success state.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Controllers/app_controllers.dart';
import 'Views/TaskList_page.dart';
import 'Views/home_page.dart';
import 'models/quote.dart'; // NEW this session: the quote model (see quote.dart)

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
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          "/home": (context) => const HomePage(),
          // CHANGED: class renamed from TasklistPage to TaskListPage in session 10.
          "/tasks": (context) => const TaskListPage(),
        },
      ),
    );
  }
}
