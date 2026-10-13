import 'package:flutter/material.dart';
import 'package:flutter_14_7/Views/task_tile.dart';

import '../models/task.dart';

class TasksPage extends StatefulWidget {
  const new({super.key});

  @override
  State<TasksPage> createState() => _TasksPageState();
}

class _TasksPageState extends State<TasksPage> {
  List<Task> tasks = [
    Task(title: "Buy Groceries", note: "Milk, eggs and bread", status: true),
    Task(title: "Finish Homework", note: "Math Chapter 5", status: false),
    Task(title: "Call Mom", note: "Wish her a happy weekend", status: false),
  ];
  void changeStatus(int index) {
    setState(() {
      tasks[index].status = !tasks[index].status!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("My Tasks"), centerTitle: true),
      body: Center(
        child: ListView.builder(
          itemCount: tasks.length,
          itemBuilder: (BuildContext context, int index) {
            return TaskTile(
              t: tasks[index],
              changeStatus: () {
                changeStatus(index);
              },
            );
          },
        ),
      ),
    );
  }
}
