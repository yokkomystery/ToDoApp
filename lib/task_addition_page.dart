import 'package:flutter/material.dart';

class TaskAdditionPage extends StatelessWidget {
  const TaskAdditionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Add Task'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: TextField(
          decoration: const InputDecoration(
            labelText: 'Task Name',
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save the task
          Navigator.pop(context);
        },
        child: const Icon(Icons.save),
      ),
    );
  }
}
