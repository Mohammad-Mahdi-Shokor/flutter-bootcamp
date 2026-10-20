import 'package:flutter/material.dart';

import 'hexColor/hex_color.dart';

class CustomColors {
  CustomColors._internal();

  static final CustomColors _singleton = CustomColors._internal();

  factory CustomColors() => _singleton;

  static Color teal = HexColor("#009688");
  static Color white = HexColor("#FFFFFF");
  static Color black = HexColor("#000000");
  static Color black54 = HexColor("#8A000000");
  static Color grey = HexColor("#9E9E9E");
  static Color red = HexColor("#F44336");
  static Color shadow = HexColor("#1A000000");
  static Color quoteBackground = HexColor("#E0F2F1");
}
