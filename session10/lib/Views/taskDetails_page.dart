import 'package:flutter/material.dart';

import '../models/task.dart';
import '../utils/custom_text_size.dart';

class TaskdetailsPage extends StatelessWidget {
  const new({super.key, required this.t});
  final Task t;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        backgroundColor: Colors.yellow[200],
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Title",
            style: TextStyle(
              fontSize: CustomTextSize.size20(context: context),
              fontWeight: FontWeight.bold,
            ),
          ),

          Text(
            t.title!,
            style: TextStyle(fontSize: CustomTextSize.size18(context: context)),
          ),
          SizedBox(height: CustomTextSize.size20(context: context)),
          Text(
            "Status",
            style: TextStyle(
              fontSize: CustomTextSize.size20(context: context),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            t.status! ? "Done" : "Note Done",
            style: TextStyle(fontSize: CustomTextSize.size18(context: context)),
          ),
          SizedBox(height: CustomTextSize.size20(context: context)),
          Text(
            "Note",
            style: TextStyle(
              fontSize: CustomTextSize.size20(context: context),
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            t.note!,
            style: TextStyle(fontSize: CustomTextSize.size18(context: context)),
          ),
        ],
      ),
    );
  }
}
