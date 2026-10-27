// ===========================================================================
// items_Controller.dart  —  NEW FILE IN SESSION 05
// ---------------------------------------------------------------------------
// The data from session 04's itemsPage.dart, moved out of the widget:
//   • `items` and `selectedIndex` used to be fields of the State class.
//   • selectIndex() used to be selectItem() with setState() inside. Now it
//     calls notifyListeners() instead.
// Same idea as CounterController: data + the methods that change it.
// ===========================================================================

import 'package:flutter/material.dart';

class ItemsController extends ChangeNotifier {
  List<String> items = [
    'Apple',
    'Banana',
    'Cherry',
    'Date',
    'Elderberry',
    'Fig',
  ];
  // Private + getter: screens can read the selected index but must call
  // selectIndex() to change it.
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners(); // replaces setState() from session 04
  }
}
