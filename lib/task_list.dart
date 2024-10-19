import 'package:flutter/material.dart';
import 'task.dart';

class TaskList extends StatelessWidget {
  final List<Task> tasks;
  final Function(Task) onTaskComplete;
  final Function(Task) onTaskDelete;

  TaskList({
    required this.tasks,
    required this.onTaskComplete,
    required this.onTaskDelete,
  });

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          title: Text(task.title),
          subtitle: Text(task.description),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: Icon(
                  task.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
                ),
                onPressed: () => onTaskComplete(task),
              ),
              IconButton(
                icon: Icon(Icons.delete),
                onPressed: () => onTaskDelete(task),
              ),
            ],
          ),
        );
      },
    );
  }
}
