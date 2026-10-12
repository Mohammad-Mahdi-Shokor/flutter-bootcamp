import 'package:flutter/material.dart';
import 'package:riverpod_part_one/Views/productDetails.dart';
import 'package:riverpod_part_one/models/product.dart';

class Productsscreen extends StatelessWidget {
  const Productsscreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (ctx) {
                    return Productdetails(p: products[index]);
                  },
                ),
              );
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
              child: ListTile(
                title: Text(products[index].name!),
                subtitle: Text("\$ ${products[index].price}"),
                trailing: Icon(Icons.arrow_forward_ios_rounded, size: 20),
              ),
            ),
          );
        },
      ),
    );
  }
}
