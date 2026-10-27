// ===========================================================================
// counter_view.dart  —  NEW FILE IN SESSION 02
// ---------------------------------------------------------------------------
// The working counter: the fix for counter2_view.dart.
//
// What's different from the broken one:
//   1. It's a StatefulWidget. It is split into TWO classes:
//        • CounterView   -> the widget (its settings never change)
//        • _CounterView  -> the State object, which stays alive between
//                           rebuilds and holds data that changes
//   2. `_counter` lives in the State class, NOT inside build(), so it keeps
//      its value when the screen rebuilds.
//   3. We change it inside setState(). setState() tells Flutter "data
//      changed, call build() again", and the new number appears on screen.
//
// Rule of thumb: if a screen needs to change after a tap, it needs state.
// ===========================================================================

import 'package:flutter/material.dart';

// Part 1: the widget. Its only job is to create the State object.
class CounterView extends StatefulWidget {
  const CounterView({super.key});

  @override
  State<CounterView> createState() => _CounterView();
}

// Part 2: the State. The `_` makes it private to this file.
class _CounterView extends State<CounterView> {
  // Stored on the State object, so it survives rebuilds.
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // this set state rebuild the widget and in that case is the CounterView
      _counter++;
      // _counter += 1;          // same thing
      // _counter = _counter + 1; // same thing
      print(_counter);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$_counter'), // updates every time setState runs
            SizedBox(height: 20), // empty space between the number and button
            // A custom round button: GestureDetector + a decorated Container.
            GestureDetector(
              onTap: () => _incrementCounter(),
              child: Container(
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.blue,
                  border: Border.all(color: Colors.black, width: 2),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: Icon(Icons.add, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
