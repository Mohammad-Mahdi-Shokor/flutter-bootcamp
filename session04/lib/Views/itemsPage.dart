// ===========================================================================
// itemsPage.dart  —  NEW FILE IN SESSION 04
// ---------------------------------------------------------------------------
// Tap an item to select it: its name shows at the top and its box gets a
// green border.
//
// This page still uses the session 02 way: a StatefulWidget with setState().
// That's on purpose. Compare it with the Riverpod counter:
//   • Here, leave the page and come back -> the selection resets to Item1,
//     because the State object is thrown away with the page.
//   • The counter keeps its value, because its data lives in a controller.
// Session 05 moves this page to Riverpod too.
//
// New idea: ListView.builder can return a DIFFERENT widget depending on the
// index. Here, the selected item gets a box with a green border.
// ===========================================================================

import 'package:flutter/material.dart';

class Itemspage extends StatefulWidget {
  const Itemspage({super.key});

  @override
  State<Itemspage> createState() => _ItemspageState();
}

class _ItemspageState extends State<Itemspage> {
  List<String> items = ["Item1", "Item2", "Item3", "Item4"];
  // We remember WHICH item is selected by its position in the list.
  int selectedIndex = 0;
  void selectItem(int i) {
    setState(() {
      selectedIndex = i;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Items Page")),
      body: Center(
        child: Column(
          children: [
            Text("selected item"),
            // Shows the name of the selected item.
            Text(
              items[selectedIndex],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
                  // The selected item: same box, plus a green border.
                  if (selectedIndex == index) {
                    return Padding(
                      padding: const EdgeInsets.all(12),
                      child: GestureDetector(
                        onTap: () {
                          selectItem(index);
                        },
                        child: Container(
                          height: 75,
                          width: 300,
                          decoration: BoxDecoration(
                            color: Colors.amber[100],
                            border: Border.all(color: Colors.green, width: 4),
                          ),
                          child: Center(child: Text(items[index])),
                        ),
                      ),
                    );
                  }

                  // Every other item: a plain box.
                  return Padding(
                    padding: const EdgeInsets.all(12),
                    child: GestureDetector(
                      onTap: () {
                        selectItem(index);
                      },
                      child: Container(
                        height: 75,
                        width: 300,
                        color: Colors.amber[100],
                        child: Center(child: Text(items[index])),
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
