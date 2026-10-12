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
  int _selectedIndex = 0;
  int get selectedIndex => _selectedIndex;
  void selectIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
