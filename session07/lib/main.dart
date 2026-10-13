import 'package:flutter/material.dart';
import 'package:flutter_14_7/Views/home.dart';
import 'package:flutter_14_7/Views/tasks_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
      routes: {
        "/home": (context) => const Home(),
        "/tasks": (context) => const TasksPage(),
      },
    );
  }
}
