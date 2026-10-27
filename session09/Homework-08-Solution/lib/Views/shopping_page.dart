// ===========================================================================
// shopping_page.dart  —  CHANGED (homework solution, tasks 1 + 2)
// ---------------------------------------------------------------------------
// WHAT CHANGED vs the starter (session08/Homework):
//   1. StatelessWidget -> ConsumerWidget, and the hardcoded list is gone.
//      The items come from ref.watch(itemProvider).items.
//   2. NEW form on top: a Name TextField, a Quantity TextField, and an
//      "Add Item" FilledButton.
//   3. The Quantity field opens the number keyboard (keyboardType) AND only
//      accepts digits (FilteringTextInputFormatter.digitsOnly). The keyboard
//      alone isn't enough: pasting or a hardware keyboard could still type
//      letters.
//   4. addTask() reads both fields, turns the quantity text into an int,
//      and calls addItem() on the controller.
//   5. The body is wrapped in 16px Padding.
// The list and goToDetailsPage() are the same as the starter.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter/services.dart'; // NEW: for FilteringTextInputFormatter
import 'package:flutter_riverpod/flutter_riverpod.dart'; // NEW
import '../controllers/app_controllers.dart'; // NEW

import '../models/item.dart';
import 'item_details.dart';

// CHANGED: was `extends StatelessWidget`.
class ShoppingPage extends ConsumerWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void goToDetailsPage(Item item) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => ItemDetails(item: item)),
      );
    }

    // NEW: one controller per TextField.
    final nameController = TextEditingController();
    final quantityController = TextEditingController();
    // CHANGED: was a hardcoded list here.
    List<Item> items = ref.watch(itemProvider).items;
    // NEW: called by the Add button.
    void addTask() {
      String name = nameController.text;
      // int.tryParse returns null when the text isn't a number (for
      // example, an empty field). `?? 0` turns that into 0, which addItem
      // rejects. (A `!` here would crash the app when the field is empty.)
      int quantity = int.tryParse(quantityController.text) ?? 0;
      ref.read(itemProvider).addItem(name, quantity);
      debugPrint("test");
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            // --- NEW: the form (task 1) ------------------------------------
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                hint: Text("Enter Item Name"),
                label: Text("Name"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            TextField(
              controller: quantityController,
              keyboardType: TextInputType.number, // number keyboard
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly, // digits only
              ],
              decoration: InputDecoration(
                hint: Text("Enter Item Quantity"),
                label: Text("Quantity"),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 10),
            FilledButton(
              onPressed: () {
                addTask();
              },
              child: Text("Add Item"),
            ),
            // TextField(
            //   maxLength: 20,
            //   controller: nameController,
            //   decoration: InputDecoration(
            //     hint: Text("Enter Task Name"),
            //     label: Text("Name"),

            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // TextField(
            //   controller: quantityController,
            //   keyboardType: TextInputType.number,
            //   inputFormatters: <TextInputFormatter>[
            //     FilteringTextInputFormatter.digitsOnly,
            //   ], // Restricts input to digits (0-9)
            //   decoration: InputDecoration(
            //     hint: Text("Enter Task Quantity"),
            //     label: Text("Quantity"),

            //     border: OutlineInputBorder(),
            //   ),
            // ),
            // SizedBox(height: 20),
            // ElevatedButton(
            //   onPressed: () {
            //     addItem();
            //   },
            //   child: Text("Add Item"),
            // ),
            // --- The list (same as the starter) ----------------------------
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (BuildContext context, int index) {
                  Item item = items[index];
                  return ListTile(
                    title: Text(item.name),
                    subtitle: Text("Quantity: ${item.quantity}"),
                    onTap: () {
                      goToDetailsPage(item);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
