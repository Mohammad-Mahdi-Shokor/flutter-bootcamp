import 'package:flutter/material.dart';

import '../models/item.dart';

class ItemDetails extends StatelessWidget {
  const ItemDetails({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Item Details"),
        backgroundColor: Colors.green[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Name",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(item.name, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            const Text(
              "Quantity",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text("${item.quantity}", style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
