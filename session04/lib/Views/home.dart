// ===========================================================================
// home.dart  —  NEW FILE IN SESSION 04
// ---------------------------------------------------------------------------
// The first screen: a menu with one button per page. Each button uses
// Navigator.pushNamed() with a route name defined in main.dart, the same
// way Page1/Page2 worked in session 03.
//
// MainAxisAlignment.spaceAround spreads the buttons out vertically, with
// equal space around each one.
// ===========================================================================

import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            // Button 1 -> the Riverpod counter
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/counter");
              },
              child: Container(
                color: Colors.blue,
                child: Text("Go to Counter", style: TextStyle(fontSize: 26)),
              ),
            ),

            // Button 2 -> the items page (setState version)
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/items");
              },
              child: Container(
                color: Colors.blue,
                child: Text("Go to items page", style: TextStyle(fontSize: 26)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
