// ===========================================================================
// item_controller.dart  —  NEW (homework solution, tasks 2 + 3)
// ---------------------------------------------------------------------------
// The two hardcoded items moved here from ShoppingPage, as a private list
// with a getter, the same way TaskController does it in session 09.
//
// addItem() takes the quantity as an int. The page turns the typed text into
// a number first (int.tryParse), and this method only checks the ranges.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemController extends ChangeNotifier {
  // MOVED from shopping_page.dart (was a local list inside build()).
  final List<Item> _items = [
    Item(name: "Milk", quantity: 5),
    Item(name: "Bread", quantity: 1),
  ];
  List<Item> get items => _items;

  //   3. Only add an item if the name is 2-20 characters
  //      and the quantity is a whole number from 1 to 99.

  void addItem(String name, int quantity) {
    if (name.length >= 2 &&
        name.length <= 20 &&
        quantity >= 1 &&
        quantity <= 99) {
      _items.add(Item(name: name, quantity: quantity));
      notifyListeners();
    }
  }
}
