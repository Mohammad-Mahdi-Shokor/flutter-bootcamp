// ===========================================================================
// custom_text_size.dart  —  NEW FILE IN SESSION 09
// ---------------------------------------------------------------------------
// Font sizes that scale with the screen, using MediaQuery from session 02.
// sizeN(context: context) returns N/1000 of the screen height:
//   size20 -> 2% of the height (20 on a 1000px-tall screen)
//   size18 -> 1.8% of the height
// So text looks the same size on a small phone and a big one, instead of a
// fixed fontSize: 20 everywhere.
//
// Used in taskDetails_page.dart. Same singleton lines as custom_colors.dart.
// ===========================================================================

import 'package:flutter/material.dart';

class CustomTextSize {
  static final CustomTextSize _singleton = CustomTextSize._internal();

  factory CustomTextSize() => _singleton;

  CustomTextSize._internal();

  static double size8({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .008;
  }

  static double size10({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .01;
  }

  static double size11({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .011;
  }

  static double size12({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .012;
  }

  static double size13({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .013;
  }

  static double size14({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .014;
  }

  static double size15({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .015;
  }

  static double size16({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .016;
  }

  static double size17({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .017;
  }

  static double size18({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .018;
  }

  static double size19({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .019;
  }

  static double size20({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .02;
  }

  static double size21({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .021;
  }

  static double size22({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .022;
  }

  static double size23({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .023;
  }

  static double size24({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .024;
  }

  static double size25({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .025;
  }

  static double size27({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .027;
  }

  static double size28({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .028;
  }

  static double size30({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .03;
  }

  static double size35({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .035;
  }

  static double size36({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .036;
  }

  static double size37({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .037;
  }

  static double size38({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .038;
  }

  static double size40({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .04;
  }

  static double size42({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .042;
  }

  static double size45({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .045;
  }

  static double size50({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .05;
  }

  static double size70({required BuildContext context}) {
    final double height = MediaQuery.of(context).size.height;
    return height * .07;
  }
}
