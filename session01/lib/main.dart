// ===========================================================================
// SESSION 01 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: our first Flutter screen. We learn that everything
// on screen is a widget, and we build a small layout out of boxes.
//
// Starting point: a brand new project from `flutter create`. That template
// comes with a big counter demo in main.dart — we deleted all of it.
//
// Files we actually changed:
//   • main.dart (this file)   REWRITTEN. Kept only the minimum: main() starts
//                             the app, MyApp returns a MaterialApp, and the
//                             first screen (`home`) is our HomeView.
//   • views/home_view.dart    NEW. Our first screen: a Scaffold with an
//                             AppBar, a FloatingActionButton, and a body made
//                             of nested Containers (BoxDecoration: color,
//                             border, borderRadius). The commented-out body
//                             at the bottom is the Row / Column grid we built
//                             first — swap it in to run it again.
//
// New packages this session: none.
//
// What we learned: main() and runApp(), StatelessWidget and build(),
// MaterialApp, Scaffold, AppBar, FloatingActionButton, Center, Container,
// BoxDecoration, Row, Column, and main/cross axis alignment.
// ===========================================================================

import 'package:flutter/material.dart';

// NEW: our first screen. A relative import, so it works no matter what you
// named your project.
import 'views/home_view.dart';

// NEW: the entry point. runApp() takes a widget and makes it the root of the
// app. `=>` is just a short way to write a one-line function.
void main() => runApp(const MyApp());

// NEW: the root widget. It never changes, so it is a StatelessWidget.
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // MaterialApp gives us Material Design (themes, AppBar styling, etc.)
    return const MaterialApp(
      debugShowCheckedModeBanner: false, // hides the red "DEBUG" ribbon
      home: HomeView(), // the first screen the user sees
    );
  }
}
