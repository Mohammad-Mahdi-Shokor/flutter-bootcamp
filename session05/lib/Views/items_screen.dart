import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_part_one/Controllers/app_controllers.dart';

class ItemsScreen extends ConsumerWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final provider = ref.watch(itemsProvider);
    List<String> items = ref.read(itemsProvider).items;
    return Scaffold(
      appBar: AppBar(title: Text("items Page")),
      body: Center(
        child: Column(
          children: [
            Text("Selected Item"),
            Text(items[provider.selectedIndex], style: TextStyle(fontSize: 20)),
            SizedBox(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  if (provider.selectedIndex == index) {
                    return GestureDetector(
                      onTap: () {
                        provider.selectIndex(index);
                        // selectIndex(index);
                      },
                      child: Container(
                        margin: EdgeInsets.all(10),
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.amber[100],
                          border: Border.all(color: Colors.green, width: 3),
                        ),
                        child: Center(child: Text(items[index])),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {
                      provider.selectIndex(index);
                    },
                    child: Container(
                      margin: EdgeInsets.all(10),
                      height: 80,
                      decoration: BoxDecoration(color: Colors.amber[100]),
                      child: Center(child: Text(items[index])),
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
