import 'package:flutter/material.dart';

import '../models/product.dart';

class Productdetails extends StatelessWidget {
  const Productdetails({super.key, required this.p});
  final Product p;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(p.name!)),
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
