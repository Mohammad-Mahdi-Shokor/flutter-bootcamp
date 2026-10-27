// ===========================================================================
// counter_controller.dart  —  NEW FILE IN SESSION 04
// ---------------------------------------------------------------------------
// The counter's data and logic, moved OUT of the widget. Compare with the
// session 02 counter, where _counter and setState() lived inside the screen.
//
//   _counter          -> private (the `_`), so screens can't change it
//                        directly...
//   get counter       -> ...they can only read it...
//   addCounter()      -> ...and change it through this method.
//   notifyListeners() -> does the job setState() used to do: it tells every
//                        widget watching this controller to rebuild.
// ===========================================================================

import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void addCounter() {
    _counter++;
    notifyListeners(); // without this, the screen would not update
  }
}
