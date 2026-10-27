// ===========================================================================
// todo.dart  —  NEW FILE IN SESSION 02
// ---------------------------------------------------------------------------
// A first sketch of one to-do item, built only from widgets we already know
// (Container, Row, Column, Text). It doesn't do anything yet; it's practice
// for putting Rows and Columns inside each other.
//
//   ┌─────────────────────────────────────────┐
//   │  ●   Title                              │   <- Row
//   │      Description                        │      ├─ round grey "checkbox"
//   └─────────────────────────────────────────┘      └─ Column (title, description)
// ===========================================================================

import 'package:flutter/material.dart';

class TodoView extends StatelessWidget {
  const TodoView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // The card itself.
        child: Container(
          height: 100,
          width: 400,
          color: Colors.amber,
          // Row: the checkbox on the left, the text on the right.
          child: Row(
            children: [
              // The round "checkbox". A big borderRadius turns a small
              // square into a circle.
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  borderRadius: BorderRadius.circular(50),
                ),
              ),
              // Column: title on top, description under it, centered
              // vertically inside the card.
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Text('Title'), Text('Description')],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
