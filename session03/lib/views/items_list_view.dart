// ===========================================================================
// items_list_view.dart  —  NEW FILE IN SESSION 03
// ---------------------------------------------------------------------------
// The same five items shown twice, so we can compare the two ways to build a
// scrolling list:
//
//   TOP    ListView          -> we write every child by hand. Simple, but
//                               every child is built right away, even the
//                               ones off-screen. Fine for a few fixed items.
//
//   BOTTOM ListView.builder  -> we give it the number of items (itemCount)
//                               and a function that builds ONE item from its
//                               index (itemBuilder). Items are built only
//                               when they scroll into view. Use this for
//                               long lists or lists that come from data.
//
// Both lists sit inside Expanded. A ListView wants infinite height, and a
// Column can't give it that, so without Expanded you get a layout error.
// Expanded says "take whatever space is left".
// ===========================================================================

import 'package:flutter/material.dart';

class ItemsListView extends StatelessWidget {
  const ItemsListView({super.key});

  // The data for ListView.builder: the item names...
  final List<String> items = const <String>[
    'Item A',
    'Item B',
    'Item C',
    'Item D',
    'Item E',
  ];
  // ...and one green shade per item (Colors.green[600], [500], ...).
  final List<int> colors = const <int>[600, 500, 400, 300, 200];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ListView Examples')),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('ListView'),
          ),
          // --- Version 1: ListView with a fixed list of children -------------
          Expanded(
            child: ListView(
              // Builds every child up front from a fixed list — simple, but not efficient for long lists.
              children: [
                Container(
                  height: 80,
                  color: Colors.green[600],
                  child: const Center(child: Text('Entry Item A')),
                ),
                Container(
                  height: 80,
                  color: Colors.green[500],
                  child: const Center(child: Text('Entry Item B')),
                ),
                Container(
                  height: 80,
                  color: Colors.green[400],
                  child: const Center(child: Text('Entry Item C')),
                ),
                Container(
                  height: 80,
                  color: Colors.green[300],
                  child: const Center(child: Text('Entry Item D')),
                ),
                Container(
                  height: 80,
                  color: Colors.green[200],
                  child: const Center(child: Text('Entry Item E')),
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8),
            child: Text('ListView.builder'),
          ),
          // --- Version 2: ListView.builder from the lists above --------------
          Expanded(
            child: ListView.builder(
              // Builds children lazily as they scroll into view — better for long or unknown-length lists.
              // itemCount: how many items to build. Always tie it to the
              // data (items.length). Try 50: from index 5 on you get red
              // error boxes, because items[5] doesn't exist (RangeError).
              // itemCount: 50,
              itemCount: items.length,
              // itemBuilder: called once per visible item, with its index
              // (0, 1, 2, ...). We use the index to read from our lists.
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  height: 80,
                  color: Colors.green[colors[index]],
                  child: Center(child: Text('Entry ${items[index]}')),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
