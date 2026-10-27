// ===========================================================================
// SESSION 05 — WHAT CHANGED IN THE PROJECT
// ---------------------------------------------------------------------------
// Theme of this session: more Riverpod, plus models and passing data between
// screens. Two features:
//   1. The items page moves from setState to Riverpod.
//   2. A products list where tapping a product opens its details page,
//      passing the tapped Product to the next screen.
//
// Files we actually changed (counter.dart and counter_controller.dart are the
// same as session 04):
//   • Controllers/items_Controller.dart NEW. ItemsController (ChangeNotifier)
//                             holds the items list and the selected index.
//                             selectIndex() updates it + notifyListeners().
//   • Controllers/app_controllers.dart  CHANGED: added itemsProvider.
//   • Views/items_screen.dart  NEW. Replaces session 04's itemsPage.dart
//                             (deleted). Same screen, but a ConsumerWidget
//                             that gets everything from itemsProvider, so the
//                             selection is kept when you leave and come back.
//   • models/product.dart     NEW. Our first MODEL class: one Product = name +
//                             description + price, grouped into one object.
//   • Views/productsScreen.dart NEW. A ListView.builder of Products shown with
//                             ListTile. Tapping one opens the details page
//                             with Navigator.push + MaterialPageRoute.
//   • Views/productDetails.dart NEW. Gets the Product through its
//                             constructor and shows its fields.
//   • Views/home.dart         CHANGED: added a "Go to products page" button.
//   • main.dart (this file)   CHANGED: imports the new screens, "/items" now
//                             opens ItemsScreen, and two new routes:
//                             "/products" and "/productsDetails" (a route
//                             that reads its data from `arguments`).
//
// New packages this session: none (flutter_riverpod from session 04).
//
// What we learned: moving a StatefulWidget to Riverpod, model classes,
// ListTile, passing data to a screen through its constructor
// (Navigator.push + MaterialPageRoute), and through route arguments
// (pushNamed + arguments + ModalRoute.of(context).settings.arguments).
// ===========================================================================

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Controllers/app_controllers.dart';
import 'Views/counter.dart';
import 'Views/home.dart';
import 'Views/items_screen.dart'; // NEW: replaces Views/itemsPage.dart
import 'Views/productDetails.dart'; // NEW
import 'Views/productsScreen.dart'; // NEW
import 'models/product.dart'; // NEW: needed to read the route's arguments

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: appContainer,
      child: MaterialApp(
        home: Home(),
        routes: {
          "/home": (ctx) => const Home(),
          "/counter": (ctx) => const counterScreen(),
          // CHANGED: was Itemspage() (the setState version).
          "/items": (ctx) => const ItemsScreen(),
          // NEW: the products list.
          "/products": (ctx) => const Productsscreen(),
          // NEW: a route that needs data. Whoever opens it passes a Product
          // as `arguments` (see the commented pushNamed in productsScreen),
          // and we read it back here, then cast it with `as Product`.
          // Use `ctx` (the new page's context), not `context`: only `ctx`
          // knows about this route, so ModalRoute.of(context) would be null.
          "/productsDetails": (ctx) {
            final product =
                ModalRoute.of(ctx)!.settings.arguments as Product;
            return Productdetails(p: product);
          },
        },
      ),
    );
  }
}
