// ===========================================================================
// productsScreen.dart  —  NEW FILE IN SESSION 05
// ---------------------------------------------------------------------------
// A list of Products. Tapping one opens its details page and SENDS the tapped
// Product along. Two ways to send data to the next screen:
//
//   ACTIVE    Navigator.push + MaterialPageRoute
//             -> we build the next screen ourselves and give it the product
//                through its constructor: Productdetails(p: products[index]).
//                No route name needed.
//
//   COMMENTED Navigator.pushNamed + arguments
//             -> we open the "/productsDetails" route by name and attach the
//                product as `arguments`. main.dart reads it back with
//                ModalRoute.of(ctx)!.settings.arguments.
//
// NEW widget: ListTile — a ready-made row with title, subtitle and a
// trailing icon.
// ===========================================================================

import 'package:flutter/material.dart';
import 'productDetails.dart';
import '../models/product.dart';

class Productsscreen extends StatelessWidget {
  const Productsscreen({super.key});

  @override
  Widget build(BuildContext context) {
    // The data: a List of our new Product model.
    List<Product> products = [
      Product(
        name: 'Apple',
        description: 'Fresh organic red apple',
        price: 1.20,
      ),
      Product(
        name: 'Bread',
        description: 'Whole wheat sliced loaf',
        price: 2.50,
      ),
      Product(
        name: 'Milk',
        description: '1 liter low-fat fresh milk',
        price: 1.80,
      ),
      Product(
        name: "Keyboard",
        price: 30.0,
        description: "High end rgb keyboard",
      ),
    ];
    return Scaffold(
      appBar: AppBar(title: Text("Products")),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              // Way 1 (active): pass the product through the constructor.
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return Productdetails(p: products[index]);
                  },
                ),
              );
              // Way 2: pass the product as route arguments.
              // Navigator.pushNamed(
              //   context,
              //   "/productsDetails",
              //   arguments: products[index],
              // );
            },
            child: Container(
              height: 80,
              margin: EdgeInsets.all(10),
              decoration: BoxDecoration(color: Colors.amber[100]),
              // NEW: ListTile lays out title / subtitle / trailing for us.
              child: ListTile(
                title: Text(products[index].name!),
                subtitle: Text("\$ ${products[index].price}"), // \$ = a real $
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
