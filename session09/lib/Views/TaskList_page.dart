import 'package:flutter/material.dart';
import 'package:flutter_13_7/Controllers/app_controllers.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../models/task.dart';
import '../widgets/tasktile.dart';

class TasklistPage extends ConsumerWidget {
  const TasklistPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Task> tasks = ref.watch(tasksProvider).tasks;

    final Title = TextEditingController();
    final note = TextEditingController();
    void deleteItem(int index) {
      showDialog(
        context: context,
        builder: (ctx) => AlertDialog(
          // what does it do
          title: Text("Delete Task?"),
          content: Text("This action cannot be undone"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(ctx);
              },
              child: Text("Cancel"),
            ),
            FilledButton(
              onPressed: () {
                Navigator.pop(ctx);
                ref.read(tasksProvider).deleteTask(index);
              },
              child: Text("Delete"),
            ),
          ],
        ),
      );

      // ref.read(tasksProvider).deleteTask(index);
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("My Tasks"),
        backgroundColor: Colors.yellow[200],
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              TextField(
                controller: Title,
                decoration: InputDecoration(
                  hint: Text("Enter Task Title"),
                  label: Text("Title"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              TextField(
                controller: note,
                decoration: InputDecoration(
                  hint: Text("Enter Task note"),
                  label: Text("Note"),
                  border: OutlineInputBorder(),
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  ref.read(tasksProvider).addTask(Title.text, note.text);
                },
                child: Text("Add Task"),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Task_Tile(
                      task: tasks[index],
                      changeStatus: () =>
                          ref.read(tasksProvider).changeStatus(index),
                      DeleteTask: () {
                        deleteItem(index);
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
