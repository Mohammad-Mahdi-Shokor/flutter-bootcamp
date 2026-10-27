// ===========================================================================
// home.dart  —  NEW FILE IN SESSION 07
// ---------------------------------------------------------------------------
// The first screen of the To-Do app. One button that opens the "/tasks"
// route.
//
// NEW widget: ElevatedButton. A real Material button with its own onPressed,
// so we no longer need GestureDetector + Container to fake one.
// ===========================================================================

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home")),
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
