import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Controllers/app_controllers.dart';

class counterScreen extends ConsumerWidget {
  const counterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: Text("Counter")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "The counter Value: ${ref.watch(counterProvider).counter}",
              style: TextStyle(fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
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
