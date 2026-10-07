import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Home Screen")),
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
                child: Text("Go to Counter", style: TextStyle(fontSize: 26)),
              ),
            ),

            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, "/items");
              },
              child: Container(
                color: Colors.blue,
                child: Text("Go to items page", style: TextStyle(fontSize: 26)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
