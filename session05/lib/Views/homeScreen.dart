import 'package:flutter/material.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/counter");
              },
              child: Container(
                color: Colors.blue,
                child: Text(
                  "Go to counter page",
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/items");
              },
              child: Container(
                color: Colors.blue,
                child: Text("Go to items page", style: TextStyle(fontSize: 24)),
              ),
            ),
            Container(
              color: Colors.blue,
              child: Text(
                "Go to products page",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
