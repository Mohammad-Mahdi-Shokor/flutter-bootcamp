import 'package:flutter/material.dart';

class Itemspage extends StatefulWidget {
  const Itemspage({super.key});

  @override
  State<Itemspage> createState() => _ItemspageState();
}

class _ItemspageState extends State<Itemspage> {
  List<String> items = ["Item1", "Item2", "Item3", "Item4"];
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
            Text(
              items[selectedIndex],
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),

            SizedBox(height: 40),
            Expanded(
              child: ListView.builder(
                itemCount: items.length,
                itemBuilder: (ctx, index) {
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
