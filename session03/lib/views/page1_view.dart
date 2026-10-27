// ===========================================================================
// page1_view.dart  —  NEW FILE IN SESSION 03
// ---------------------------------------------------------------------------
// Navigation demo, screen 1 (the `initialRoute`).
// Tapping the blue text pushes Page 2 on top of this page.
//
// Navigator.pushNamed(context, '/Page2View') looks the name up in the
// `routes` map in main.dart and opens that screen. The name must match
// EXACTLY (including the capital letters), or the app throws an error.
// ===========================================================================

import 'package:flutter/material.dart';

class Page1View extends StatelessWidget {
  const Page1View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 1')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // NEW: open Page 2 on top of this one (Page 1 stays underneath,
            // so Page 2 gets a back arrow).
            Navigator.pushNamed(context, '/Page2View');
          },
          child: Container(
            color: Colors.blue,
            child: const Text('Go to Page 2', style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
