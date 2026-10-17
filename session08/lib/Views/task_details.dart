import 'package:flutter/material.dart';
import 'package:flutter_14_7/models/task.dart';

class TaskDetails extends StatelessWidget {
  const new({super.key, required this.t});
  final Task t;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        backgroundColor: Colors.amber[200],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Title",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(t.title!, style: TextStyle(fontSize: 20)),
            SizedBox(height: 20),
            Text(
              "Status",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(
              t.status! ? "Done" : "Not Done",
              style: TextStyle(fontSize: 20),
            ),
            SizedBox(height: 20),
            Text(
              "Note",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            Text(t.note!, style: TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}
