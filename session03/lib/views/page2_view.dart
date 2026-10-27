// ===========================================================================
// page2_view.dart  —  NEW FILE IN SESSION 03
// ---------------------------------------------------------------------------
// Navigation demo, screen 2. Shows three ways to leave a page. Think of the
// pages as a stack of cards:
//
//   pushNamed(...)                -> put a NEW card on top. Going "back" to
//                                    Page 1 this way piles up copies:
//                                    Page1 -> Page2 -> Page1 -> Page2 ...
//   pop(context)                  -> remove the top card and return to the
//                                    page underneath (the real "back").
//   pushNamedAndRemoveUntil(...)  -> open a page AND throw away the cards
//                                    under it. With (route) => false, nothing
//                                    is kept, so there is no back arrow.
//                                    (Used after login or logout, for
//                                    example.)
//
// The active line is pushNamedAndRemoveUntil. Swap in the others to compare.
// ===========================================================================

import 'package:flutter/material.dart';

class Page2View extends StatelessWidget {
  const Page2View({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Page 2')),
      body: Center(
        child: GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, '/Page1View'); // go to Page1
            // Navigator.pop(context); // go back to previous page
            Navigator.pushNamedAndRemoveUntil(context, '/Page1View',(route) => false); // remove all previous pages and go to Page1
          },
          child: Container(
            color: Colors.blue,
            child: const Text('Go to Page 1', style: TextStyle(fontSize: 24)),
          ),
        ),
      ),
    );
  }
}
