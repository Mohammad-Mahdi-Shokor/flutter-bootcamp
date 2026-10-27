// ===========================================================================
// SESSION 08 HOMEWORK — SOLUTION
// ---------------------------------------------------------------------------
// Starting point: session08/Homework/lib (items hardcoded in ShoppingPage).
// The homework asked for:
//   1. Two TextFields (name + quantity) and an "Add" button
//      to ShoppingPage. The quantity field must only show the number keyboard.
//   2. Move the list of items to Riverpod:
//      - create a controller (ChangeNotifier) that holds the items
//        and has an addItem(name, quantityText) method
//      - create a provider for it and connect it to the app here in main.dart
//      - make ShoppingPage read the items from the provider
//   3. Only add an item if the name is 2-20 characters
//      and the quantity is a whole number from 1 to 99.
//
// Files we actually changed (models/item.dart and Views/item_details.dart
// are the same as the starter):
//   • controllers/item_controller.dart NEW. ItemController holds the items
//                             (private _items + getter) and addItem() with
//                             the validation rules (task 2 + task 3).
//   • controllers/app_controllers.dart NEW. appcontainer + itemProvider.
//   • Views/shopping_page.dart CHANGED: StatelessWidget -> ConsumerWidget,
//                             items come from itemProvider, and the new form
//                             (2 TextFields + FilledButton) is on top (task 1).
//   • main.dart (this file)   CHANGED: wrapped in UncontrolledProviderScope.
//
// Same steps as moving the To-Do app to Riverpod in session 08.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart'; // NEW
import 'controllers/app_controllers.dart'; // NEW

import 'Views/shopping_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // CHANGED: was `return const MaterialApp(home: ShoppingPage());`
    // Wrapping it connects Riverpod to the app.
    return UncontrolledProviderScope(
      container: appcontainer,
      child: const MaterialApp(home: ShoppingPage()),
    );
  }
}
