// ===========================================================================
// taskDetails_page.dart  —  RENAMED + CHANGED IN SESSION 09
// ---------------------------------------------------------------------------
// (was Views/task_details.dart, class TaskDetails)
//
// WHAT CHANGED vs session 08:
//   1. Padding + Column -> ListView with padding. Same layout, but the page
//      can scroll if the note is very long.
//   2. Font sizes and spacing come from CustomTextSize (utils/) instead of
//      fixed numbers like 22 and 20, so they scale with the screen height.
//   3. AppBar is yellow now, to match the rest of the app.
// ===========================================================================

import 'package:flutter/material.dart';
import '../models/task.dart';
import '../utils/custom_text_size.dart'; // NEW

// RENAMED: was TaskDetails.
class TaskdetailsPage extends StatelessWidget {
  const TaskdetailsPage({super.key, required this.t});
  final Task t;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        backgroundColor: Colors.yellow[200], // CHANGED: was amber
      ),
      // CHANGED: was Padding(child: Column(...)).
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Text(
            "Title",
            style: TextStyle(
              // NEW: size20 = 2% of the screen height.
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
