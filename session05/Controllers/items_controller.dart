import 'package:flutter/material.dart';

class ItemsController extends ChangeNotifier {
  final items = ["item 1", "item 2", "item 3", "item 4"];
  int _indexOfItem = 0;
  int get indexOfItem => _indexOfItem;
  void selectItem(int index) {
    _indexOfItem = index;
    notifyListeners();
  }
}
