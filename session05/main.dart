import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_applicatin/Controllers/app_providers.dart';
import 'package:riverpod_applicatin/Views/counterScreen.dart';
import 'package:riverpod_applicatin/Views/homeScreen.dart';
import 'package:riverpod_applicatin/Views/items_screen.dart';

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
        home: Homescreen(),
        routes: {
          "/home": (ctx) => const Homescreen(),
          "/counter": (ctx) => Counterscreen(),
          "/items": (ctx) => itemsScreen(),
        },
      ),
    );
  }
}
