import 'package:flutter/material.dart';

import '../models/item.dart';
import 'item_details.dart';

class ShoppingPage extends StatelessWidget {
  const ShoppingPage({super.key});

  @override
  Widget build(BuildContext context) {
    // These items are hardcoded. Move them to Riverpod.
    List<Item> items = [
      Item(name: "Milk", quantity: 2),
      Item(name: "Bread", quantity: 1),
    ];

    void goToDetailsPage(Item item) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (ctx) => ItemDetails(item: item)),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shopping List"),
        centerTitle: true,
        backgroundColor: Colors.green[200],
      ),
      body: Column(
        children: [
          // Add the TextFields and the "Add" button here.
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
    );
  }
}
