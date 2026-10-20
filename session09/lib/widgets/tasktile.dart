import 'package:flutter/material.dart';
import 'package:flutter_13_7/Views/taskDetails_page.dart';
import 'package:flutter_13_7/utils/custom_colors.dart';

import '../models/task.dart';

class Task_Tile extends StatelessWidget {
  const new({
    super.key,
    required this.task,
    required this.changeStatus,
    required this.DeleteTask,
  });

  final Task task;
  final VoidCallback changeStatus;
  final VoidCallback DeleteTask;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (ctx) {
              return TaskdetailsPage(t: task);
            },
          ),
        );
      },
      child: Container(
        margin: EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(12),
        ),
        child: ListTile(
          title: Text(
            task.title!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              decoration: task.status! ? TextDecoration.lineThrough : null,
            ),
          ),
          subtitle: Text(task.note!),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              GestureDetector(
                onTap: () {
                  changeStatus();
                },
                child: Icon(
                  task.status!
                      ? Icons.check_circle
                      : Icons.radio_button_unchecked,
                ),
              ),
              SizedBox(width: 10),
              GestureDetector(
                onTap: () {
                  DeleteTask();
                },
                child: Icon(Icons.delete, color: CustomColors.red),
              ),
            ],
          ),
          // IconButton(
          //   onPressed: () {},
          //   icon: Icon(Icons.check_circle),
          // ),
          // GestureDetector(child: Icon(Icons.check_circle)),
        ),

        //  Row(
        //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //   children: [
        //     Column(children: [Text("Text1"), Text("Text2")]),
        //     Icon(Icons.check_circle),
        //   ],
        // ),
      ),
    );
  }
}
