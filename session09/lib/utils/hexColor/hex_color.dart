// ===========================================================================
// hex_color.dart  —  NEW FILE IN SESSION 09
// ---------------------------------------------------------------------------
// Lets us write colors the way designers give them to us: HexColor("#F44336").
//
// How it works:
//   "#F44336" -> remove "#" -> "F44336"
//   6 characters? add "FF" in front (FF = fully opaque) -> "FFF44336"
//   read it as a base-16 number -> pass it to Color.
// An 8-character value like "#8A000000" already has its opacity (8A), so it
// is used as is.
// ===========================================================================

import 'package:flutter/material.dart';

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll("#", "");
    if (hexColor.length == 6) {
      hexColor = "FF$hexColor";
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(String hexColor) : super(_getColorFromHex(hexColor));
}
