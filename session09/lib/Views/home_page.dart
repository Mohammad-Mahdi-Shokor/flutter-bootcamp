// ===========================================================================
// home_page.dart  —  RENAMED IN SESSION 09
// ---------------------------------------------------------------------------
// (was Views/home.dart, class Home)
//
// WHAT CHANGED vs session 08:
//   • File and class renamed to home_page.dart / HomePage.
//   • AppBar is yellow (was amber), and the debugPrint("hello") is gone.
// The button still opens "/tasks".
// ===========================================================================

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home"), backgroundColor: Colors.yellow[200]),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pushNamed(context, "/tasks");
          },
          child: Text("View my tasks"),
        ),
      ),
    );
  }
}
