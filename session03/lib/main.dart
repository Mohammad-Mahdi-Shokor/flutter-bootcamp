// ===========================================================================
// SESSION 03 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: lists and moving between screens. Two topics, two
// demos — `home` runs the list demo, and the commented routes below run the
// navigation demo.
//
// Fresh project this session: the session 02 screens (home, todo, counters)
// and the assets/ folder are NOT carried over.
//
// Files we actually changed:
//   • views/items_list_view.dart NEW. Two scrolling lists on one screen:
//                                ListView (every child written out by hand)
//                                vs ListView.builder (children built from a
//                                List, only when they scroll into view).
//   • views/page1_view.dart      NEW. Navigation demo, screen 1. Tapping
//                                the button goes to Page 2 with pushNamed().
//   • views/page2_view.dart      NEW. Navigation demo, screen 2. Goes back
//                                to Page 1 with pushNamedAndRemoveUntil(),
//                                which also clears the history (no back
//                                arrow). pushNamed() and pop() are left in
//                                the comments to compare.
//   • main.dart (this file)      CHANGED: `home` is ItemsListView, and we
//                                added (commented out) `initialRoute` and a
//                                `routes` map that gives each page a name.
//
// To run the NAVIGATION demo: comment out the `home:` line, then uncomment
// `initialRoute` and `routes`.
//
// New packages this session: none.
//
// What we learned: ListView vs ListView.builder (itemCount, itemBuilder,
// index), Expanded, Padding, named routes (routes, initialRoute),
// Navigator.pushNamed, Navigator.pop, Navigator.pushNamedAndRemoveUntil.
// ===========================================================================

import 'package:flutter/material.dart';

// NEW: the three screens of this session.
import 'views/items_list_view.dart';
import 'views/page1_view.dart';
import 'views/page2_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // CHANGED: the list demo is now the first screen.
      home:  ItemsListView(),

      // NEW: named routes (the navigation demo).
      // 1. where you start
      // initialRoute: '/Page1View',
      //
      // // // 2. Define the map of all available routes
      // //       name of the route -> the screen it opens
      // routes: {
      //   '/Page1View': (context) => const Page1View(),
      //   '/Page2View': (context) => const Page2View(),
      // }
    );
  }
}
