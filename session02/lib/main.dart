// ===========================================================================
// SESSION 02 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: images, screen sizes, and making the screen react to
// a tap. We meet StatefulWidget and setState() for the first time.
//
// Files we actually changed (since session 01):
//   • views/home_view.dart     CHANGED. The nested boxes are gone. The screen
//                              now uses MediaQuery to size a box relative to
//                              the screen, and shows an image from the
//                              assets/ folder inside a circle
//                              (DecorationImage + BoxShape.circle).
//   • views/todo.dart          NEW. A first try at a to-do card: a Row with a
//                              round "checkbox" and a Column of title +
//                              description. Static UI only.
//   • views/counter2_view.dart NEW. A counter built as a StatelessWidget.
//                              Tapping + changes the number (see the console)
//                              but the screen never updates. That's the point.
//   • views/counter_view.dart  NEW. The same counter as a StatefulWidget.
//                              setState() tells Flutter to rebuild, so now
//                              the number on screen goes up.
//   • main.dart (this file)    CHANGED: imports the four screens above and
//                              picks which one is `home`. Change the `home:`
//                              line to run a different screen.
//   • pubspec.yaml             CHANGED: registers the images under `assets:`
//                              (see the session README for the exact lines).
//   • assets/                  NEW folder with image1–image4.jpeg.
//
// New packages this session: none.
//
// What we learned: MediaQuery, Image.asset / Image.network, AssetImage +
// DecorationImage, BoxFit, BoxShape.circle, declaring assets in
// pubspec.yaml, GestureDetector + onTap, StatelessWidget vs StatefulWidget,
// and setState().
// ===========================================================================

import 'package:flutter/material.dart';

// NEW: one import per screen we built this session.
import 'views/counter2_view.dart';
import 'views/counter_view.dart';
import 'views/home_view.dart';
import 'views/todo.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // debugShowCheckedModeBanner: false,

      // CHANGED: `home` used to be the session 01 HomeView.
      // Only one screen can be `home`, so pick one:
      //   home: HomeView(),     // image in a circle, sized with MediaQuery
      //   home: TodoView(),     // static to-do card
      //   home: Counter2View(), // stateless counter — screen does NOT update
      //   home: CounterView(),  // stateful counter — setState updates it
      home: Counter2View(),
    );
  }
}
