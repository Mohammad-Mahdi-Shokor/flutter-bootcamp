import 'package:flutter/material.dart';
import 'package:flutter_14_7/Views/task_details.dart';
import 'package:flutter_14_7/controllers/app_controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../widgets/task_tile.dart';

import '../models/task.dart';

class TasksPage extends ConsumerWidget {
  const TasksPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasks = ref.watch(taskProvider).tasks;
    final titleController = TextEditingController();
    final noteController = TextEditingController();
    void changeStatus(int index) {
      ref.read(taskProvider).changeStatus(index);
    }

    void goToDetailsPage(Task t) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (ctx) {
            return TaskDetails(t: t);
          },
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        centerTitle: true,
        backgroundColor: Colors.amber[200],
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: titleController,
                decoration: InputDecoration(hint: Text("Enter Task Title")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: TextField(
                controller: noteController,
                decoration: InputDecoration(hint: Text("Enter Task Note")),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                ref
                    .read(taskProvider)
                    .addTask(titleController.text, noteController.text);
              },
              child: Text("Add Task"),
            ),
            SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: tasks.length,
                itemBuilder: (BuildContext context, int index) {
                  return TaskTile(
                    t: tasks[index],
                    changeStatus: () {
                      changeStatus(index);
                    },
                    goToDetailsPage: () {
                      goToDetailsPage(tasks[index]);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
