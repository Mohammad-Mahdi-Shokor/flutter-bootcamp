import 'package:flutter/material.dart';
import 'package:flutter_14_7/controllers/app_controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'Views/home.dart';
import 'Views/tasks_page.dart';

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
        home: Home(),
        routes: {
          "/home": (context) => const Home(),
          "/tasks": (context) => const TasksPage(),
        },
      ),
    );
  }
}
