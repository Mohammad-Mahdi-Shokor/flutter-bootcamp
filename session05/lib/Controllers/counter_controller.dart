import 'package:flutter/material.dart';

class CounterController extends ChangeNotifier {
  int _counter = 0;
  int get counter => _counter;

  void addCounter() {
    _counter++;
    notifyListeners();
  }
}
