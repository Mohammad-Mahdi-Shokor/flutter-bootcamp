// ===========================================================================
// task_details.dart  —  NEW FILE IN SESSION 08
// ---------------------------------------------------------------------------
// Shows everything about ONE task: title, status, note. Like Productdetails
// in session 05, it receives the Task through its constructor
// (`required this.t`), so it can't be opened without one.
//
// Each section is a bold label + the value under it.
// CrossAxisAlignment.start lines everything up on the left.
// ===========================================================================

import 'package:flutter/material.dart';
import '../models/task.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.t});
  final Task t; // the task to show, passed in by tasks_page.dart
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
            // The bool turned into readable text.
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
