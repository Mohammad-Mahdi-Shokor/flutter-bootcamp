// ===========================================================================
// task_tile.dart  —  MOVED + CHANGED IN SESSION 08
// ---------------------------------------------------------------------------
// WHAT CHANGED vs session 07:
//   1. MOVED from Views/ to widgets/. Views/ is for full screens, widgets/
//      is for small reusable pieces like this tile.
//   2. NEW parameter: goToDetailsPage (another VoidCallback).
//   3. The whole tile is wrapped in a GestureDetector that calls
//      goToDetailsPage. So now there are two tap targets:
//        • tap the tile -> open the details page
//        • tap the icon -> toggle done / not done (same as before)
//      The inner GestureDetector (the icon) wins when you tap the icon.
// ===========================================================================

import 'package:flutter/material.dart';

import '../models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.t,
    required this.changeStatus,
    required this.goToDetailsPage, // NEW
  });
  final Task t;
  final VoidCallback changeStatus;
  final VoidCallback goToDetailsPage; // NEW
  @override
  Widget build(BuildContext context) {
    // NEW: tapping anywhere on the tile opens the details page.
    return GestureDetector(
      onTap: () {
        goToDetailsPage();
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue[300],
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            t.title!,
            style: TextStyle(
              decoration: t.status! ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(t.note!),
          // Same as session 07: tapping the icon toggles the status.
          trailing: GestureDetector(
            onTap: () {
              changeStatus();
            },
            child: Icon(
              t.status! ? Icons.check_circle : Icons.radio_button_unchecked,
            ),
          ),
        ),
      ),
    );
  }
}
