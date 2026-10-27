// ===========================================================================
// productDetails.dart  —  NEW FILE IN SESSION 05
// ---------------------------------------------------------------------------
// Shows ONE product. The screen doesn't know which product to show by
// itself, so it asks for one in its constructor:
//
//   const Productdetails({super.key, required this.p});
//
// `required` means you can't open this screen without giving it a Product.
// Whoever opens the page (productsScreen.dart, or the "/productsDetails"
// route in main.dart) passes the tapped product in.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/product.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key, required this.p});
  // The product this page shows, received from the previous screen.
  final Product p;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(p.name!)), // the title is the product's name
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("\$ ${p.price}", style: TextStyle(fontSize: 24)),
            Text(p.description!),
          ],
        ),
      ),
    );
  }
}
