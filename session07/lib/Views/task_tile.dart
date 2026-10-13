import 'package:flutter/material.dart';
import 'package:flutter_14_7/models/task.dart';

class TaskTile extends StatelessWidget {
  const new({super.key, required this.t, required this.changeStatus});
  final Task t;
  final VoidCallback changeStatus;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        trailing: GestureDetector(
          onTap: () {
            changeStatus();
          },
          child: Icon(
            t.status! ? Icons.check_circle : Icons.radio_button_unchecked,
          ),
        ),
      ),
    );
  }
}
