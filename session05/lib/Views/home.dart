// ===========================================================================
// home.dart  —  CHANGED IN SESSION 05
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 04:
//   Added a third button, "Go to products page", which opens the new
//   "/products" route. The other two buttons are the same.
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
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/counter");
              },
              child: Container(
                color: Colors.blue,
                child: Text("Go to Counter", style: TextStyle(fontSize: 26)),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/items");
              },
              child: Container(
                color: Colors.blue,
                child: Text("Go to items page", style: TextStyle(fontSize: 26)),
              ),
            ),
            // NEW: third button -> the products list.
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/products");
              },
              child: Container(
                color: Colors.blue,
                child: Text(
                  "Go to products page",
                  style: TextStyle(fontSize: 26),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
