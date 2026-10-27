// ===========================================================================
// home_view.dart  —  NEW FILE IN SESSION 01
// ---------------------------------------------------------------------------
// Our very first screen. It shows the three main parts of a Scaffold:
//   1. appBar               -> the bar at the top
//   2. floatingActionButton -> the round button at the bottom right
//   3. body                 -> everything else
//
// The body has two versions:
//   • ACTIVE:    a red rounded box centered inside a blue box (nesting
//                Containers + BoxDecoration).
//   • COMMENTED: a 3x3 grid of colored squares built with one Column and
//                three Rows (main axis vs cross axis). We built this one
//                first. To run it, comment out the active `body:` and
//                uncomment the other one — a Scaffold can only have one body.
// ===========================================================================

import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // Scaffold = the basic page structure (app bar, body, FAB, ...).
    return Scaffold(
      // --- Floating action button ---------------------------------------------
      // onPressed is empty for now: we only care about how it looks.
      // (Buttons and taps come in session 02.)
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add_a_photo),
      ),

      // --- App bar ------------------------------------------------------------
      appBar: AppBar(
        title: const Text('Row and Column'),
        backgroundColor: Colors.blue,
      ),

      // --- Body (version 2): nested Containers -------------------------------
      // Center puts its child in the middle of the screen.
      body: Center(
        // Outer box: a plain blue 200x200 square. When we only need a color,
        // we can use `color:` directly.
        child: Container(
          width: 200,
          height: 200,
          color: Colors.blue,
          child: Center(
            // Inner box: needs more than a color, so we use BoxDecoration.
            // RULE: if you use `decoration:`, put the color INSIDE it.
            // Using `color:` and `decoration:` together throws an error.
            child: Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: Colors.red,
                // Border on one side only. Use Border.all(...) for all four.
                border: const Border(
                  bottom: BorderSide(color: Colors.black, width: 2),
                ),
                borderRadius: BorderRadius.circular(30), // rounded corners
              ),
            ),
          ),
        ),
      ),

      // --- Body (version 1): a grid with Row and Column ----------------------
      // Column stacks children top -> bottom, Row places them left -> right.
      // mainAxisAlignment  = alignment along the direction the widget lays
      //                      out (vertical for Column, horizontal for Row).
      // crossAxisAlignment = alignment on the other axis.
      //
      // body: Column(
      //   mainAxisAlignment: MainAxisAlignment.center,
      //   crossAxisAlignment: CrossAxisAlignment.center,
      //   children: [
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(
      //           width: 50,
      //           height: 50,
      //           // color: Colors.red,
      //           decoration: BoxDecoration(
      //             border: Border.all(color: Colors.black, width: 2),
      //             borderRadius: BorderRadius.circular(30),
      //           ),
      //         ),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //         Container(width: 50, height: 50, color: Colors.red),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.blue),
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //       ],
      //     ),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.center,
      //       children: [
      //         Container(width: 50, height: 50, color: Colors.red),
      //         Container(width: 50, height: 50, color: Colors.blue),
      //         Container(width: 50, height: 50, color: Colors.red),
      //       ],
      //     ),
      //   ],
      // ),
    );
  }
}
