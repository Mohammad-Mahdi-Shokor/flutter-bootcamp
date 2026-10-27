// ===========================================================================
// home.dart  —  CHANGED IN SESSION 08
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 07:
//   • The AppBar is amber, to match the rest of the app.
//   • The button prints "hello" with debugPrint() before navigating. That's
//     just to show debugPrint: like print(), but meant for debug output (and
//     the analyzer doesn't warn about it).
// ===========================================================================

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // CHANGED: added backgroundColor.
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.amber[200]),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            debugPrint("hello"); // NEW: shows in the debug console
            Navigator.pushNamed(context, "/tasks");
          },
          child: Text("View my tasks"),
        ),
      ),
    );
  }
}
