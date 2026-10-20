import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:session08_homework/controllers/app_controllers.dart';

import 'Views/shopping_page.dart';

// HOMEWORK
// This app works, but the items are hardcoded inside ShoppingPage.
// Your job:
//   1. Add two TextFields (name + quantity) and an "Add" button
//      to ShoppingPage. The quantity field must only show the number keyboard.
//   2. Move the list of items to Riverpod:
//      - create a controller (ChangeNotifier) that holds the items
//        and has an addItem(name, quantityText) method
//      - create a provider for it and connect it to the app here in main.dart
//      - make ShoppingPage read the items from the provider
//   3. Only add an item if the name is 2-20 characters
//      and the quantity is a whole number from 1 to 99.

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: appcontainer,
      child: const MaterialApp(home: ShoppingPage()),
    );
  }
}
