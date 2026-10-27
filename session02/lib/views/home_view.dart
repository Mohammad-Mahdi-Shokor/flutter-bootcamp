// ===========================================================================
// home_view.dart  —  CHANGED IN SESSION 02
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 01:
//   1. The AppBar, FloatingActionButton, and nested red/blue boxes are gone.
//   2. NEW: MediaQuery. We read the screen's width and height and size the
//      box as a percentage of them (50% wide, 20% tall), so it looks right
//      on any phone instead of using fixed numbers like 200.
//   3. NEW: images. The box shows assets/image2.jpeg, clipped to a circle.
//      The commented code below shows the other ways we tried:
//        • NetworkImage / Image.network -> load an image from a URL
//        • Image.asset                  -> an image as a widget by itself
//
// Images from assets/ only load if they are listed under `assets:` in
// pubspec.yaml. If you see "Unable to load asset", check that first.
// ===========================================================================

import 'package:flutter/material.dart';

// widgets: text, center, row, column, container
class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    // NEW: MediaQuery gives us the size of the screen we are running on.
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Center(
        child:
        // CHANGED: the size is now relative to the screen, not fixed.
        Container(
          width: width * 0.5, // 50% of the screen width
          height: height * 0.2, // 20% of the screen height
          decoration: BoxDecoration(
            // NEW: makes the box (and the image inside it) a circle.
            shape: BoxShape.circle,
            // NEW: an image used as the box's background.
            image: DecorationImage(
              // AssetImage -> a file from our assets/ folder.
              image: AssetImage('assets/image2.jpeg'),
              // BoxFit.cover -> fill the whole box, cropping if needed.
              fit: BoxFit.cover,
              // Same idea, but loading the image from the internet:
              // image: NetworkImage(
              //   'https://picsum.photos/seed/nature/400',
              // ),

            ),
          ),
        ),

        // Other ways to show an image (swap one in as the `child:` above):
        //
        // 1. An image from a URL, as a widget by itself:
        // Image.network(
        //   'https://picsum.photos/seed/nature/400',
        //   fit: BoxFit.cover,
        // ),
        //
        // 2. An image from assets/, inside a sized Container:
        // Container(
        //   color: Colors.red,
        //   width: width * 0.5,
        //   height: height * 0.2,
        //   child: Image.asset('assets/image1.jpeg'),
        // ),
      ),
    );
  }
}
