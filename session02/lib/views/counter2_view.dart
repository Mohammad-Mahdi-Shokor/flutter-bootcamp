// ===========================================================================
// counter2_view.dart  —  NEW FILE IN SESSION 02
// ---------------------------------------------------------------------------
// The "broken" counter. We built this one FIRST, on purpose.
//
// Run it and tap the + icon:
//   • The console prints 1, 2, 3, ... -> the variable really is changing.
//   • The number on screen stays at 0 -> the UI never rebuilds.
//
// Why? A StatelessWidget has no way to tell Flutter "something changed,
// draw me again". And even if it did, `_count` is declared INSIDE build(),
// so every rebuild would reset it back to 0.
//
// The fix is counter_view.dart: a StatefulWidget + setState().
// ===========================================================================

import 'package:flutter/material.dart';

class Counter2View extends StatelessWidget {
  const Counter2View({super.key});

  @override
  Widget build(BuildContext context) {
    // Lives inside build(), so it is created again (as 0) on every build.
    int _count = 0;

    void _incrementCounter() {
      _count++; // the value changes...
      print(_count); // ...and we can see it in the console...
      // ...but nothing tells Flutter to redraw the Text below.
    }

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_count'), // always shows 0
            // NEW: GestureDetector makes any widget tappable via onTap.
            GestureDetector(
              onTap: () {
                _incrementCounter();
              },
              child: Icon(Icons.add),),
          ],
        ),
      ),
    );
  }
}
