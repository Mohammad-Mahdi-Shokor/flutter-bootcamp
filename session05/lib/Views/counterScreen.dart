import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_applicatin/Controllers/app_providers.dart'
    show counterProvider;

class Counterscreen extends ConsumerWidget {
  const Counterscreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter Page")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "This button has been pressed this many times",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 30),
            ),
            Text(
              "${ref.watch(counterProvider).counter}",
              style: TextStyle(fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                color: Colors.blue,
                shape: BoxShape.circle,
              ),
              child: IconButton(
                onPressed: () {
                  ref.read(counterProvider).addCounter();
                },
                icon: Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
