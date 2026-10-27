// ===========================================================================
// items_screen.dart  —  NEW FILE IN SESSION 05 (replaces itemsPage.dart)
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 04's itemsPage.dart:
//   1. StatefulWidget + State class -> one ConsumerWidget. The screen holds
//      no data anymore; the list and the selected index live in
//      ItemsController.
//   2. selectItem(index) + setState -> provider.selectIndex(index).
//   3. Because the data lives in the controller, the selection is kept when
//      you go back to Home and open this page again.
// The layout is the same: selected item at the top, green border on the
// selected box.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Controllers/app_controllers.dart';

// CHANGED: was `class Itemspage extends StatefulWidget`.
class ItemsScreen extends ConsumerWidget {
  const ItemsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // watch -> rebuild this screen when selectIndex() calls notifyListeners.
    final provider = ref.watch(itemsProvider);
    // read is enough for the list: it never changes in this app.
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
                        // CHANGED: the controller does the update now.
                        provider.selectIndex(index);
                        // selectIndex(index);   // session 04 (setState) way
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
                      provider.selectIndex(index); // CHANGED: same as above
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
