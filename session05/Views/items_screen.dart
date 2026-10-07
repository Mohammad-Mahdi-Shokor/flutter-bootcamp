import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_applicatin/Controllers/app_providers.dart';

class itemsScreen extends ConsumerWidget {
  const itemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.read(itemProvider);
    List<String> items = provider.items;
    return Scaffold(
      appBar: AppBar(title: Text("Items Page")),
      body: Center(
        child: Column(
          children: [
            Text("Selected Item"),
            Text(
              items[ref.watch(itemProvider).indexOfItem],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 50),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, i) {
                  if (i == ref.watch(itemProvider).indexOfItem) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: GestureDetector(
                        onTap: () {
                          ref.read(itemProvider).selectItem(i);
                        },
                        child: Container(
                          width: 400,
                          height: 75,
                          decoration: BoxDecoration(
                            color: Colors.amber[100],
                            border: Border.all(color: Colors.green, width: 3),
                          ),
                          child: Center(child: Text(items[i])),
                        ),
                      ),
                    );
                  }
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: GestureDetector(
                      onTap: () {
                        provider.selectItem(i);
                      },
                      child: Container(
                        width: 400,
                        height: 75,
                        decoration: BoxDecoration(color: Colors.amber[100]),
                        child: Center(child: Text(items[i])),
                      ),
                    ),
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
