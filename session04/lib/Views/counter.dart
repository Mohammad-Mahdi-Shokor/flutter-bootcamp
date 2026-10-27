// ===========================================================================
// counter.dart  —  NEW FILE IN SESSION 04
// ---------------------------------------------------------------------------
// The counter screen, now powered by Riverpod.
//
// It's a ConsumerWidget, not a StatefulWidget: the screen keeps no data of
// its own. build() gets an extra parameter, `WidgetRef ref`, which is how we
// talk to providers:
//   ref.watch(counterProvider) -> read the value AND rebuild this screen
//                                 whenever it changes. Use it in build().
//   ref.read(counterProvider)  -> just get the controller once, no
//                                 rebuilding. Use it inside onPressed/onTap.
//
// Try it: tap + a few times, go back to Home, open the counter again. The
// number is still there, because it lives in the controller, not the screen.
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Controllers/app_controllers.dart';

// NEW: ConsumerWidget = a StatelessWidget that can use `ref`.
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
              // watch -> this Text updates every time the counter changes.
              "The counter Value: ${ref.watch(counterProvider).counter}",
              style: TextStyle(fontSize: 30),
            ),
            Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.blue,
              ),
              // NEW: IconButton — a ready-made tappable icon (instead of
              // GestureDetector + Icon).
              child: IconButton(
                onPressed: () {
                  // read -> we only need to call a method, not listen.
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
