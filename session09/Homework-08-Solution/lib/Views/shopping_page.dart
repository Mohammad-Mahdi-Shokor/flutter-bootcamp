import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:session08_homework/controllers/app_controllers.dart';

import '../models/item.dart';
import 'item_details.dart';

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

    final nameController = TextEditingController();
    final quantityController = TextEditingController();
    List<Item> items = ref.watch(itemProvider).items;
    void addTask() {
      String name = nameController.text;
      int quantity = int.tryParse(quantityController.text)!;
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
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
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
