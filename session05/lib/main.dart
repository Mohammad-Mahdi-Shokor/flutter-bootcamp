import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_part_one/Controllers/app_controllers.dart';
import 'package:riverpod_part_one/Views/counter.dart';
import 'package:riverpod_part_one/Views/home.dart';
import 'package:riverpod_part_one/Views/items_screen.dart';
import 'package:riverpod_part_one/Views/productDetails.dart';
import 'package:riverpod_part_one/Views/productsScreen.dart';
import 'package:riverpod_part_one/models/product.dart';

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
          "/items": (ctx) => const ItemsScreen(),
          "/products": (ctx) => const Productsscreen(),
          "/productsDetails": (ctx) {
            final product =
                ModalRoute.of(context)!.settings.arguments as Product;
            return Productdetails(p: product);
          },
        },
      ),
    );
  }
}
