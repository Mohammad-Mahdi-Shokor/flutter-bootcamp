import 'package:flutter/material.dart';
import 'package:flutter_13_7/Controllers/app_controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Views/TaskList_page.dart';
import 'Views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return UncontrolledProviderScope(
      container: appcontainer,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
        routes: {
          "/home": (context) => const HomePage(),
          "/tasks": (context) => const TasklistPage(),
        },
      ),
    );
  }
}
