import 'package:flutter/material.dart';
import 'task.dart';
import 'task_list.dart';
import 'filter_options.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ToDo App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'ToDo App Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Task> tasks = [];
  bool showCompleted = false;

  void _addTask(String title, String description) {
    setState(() {
      tasks.add(Task(
        title: title,
        description: description,
        creationDate: DateTime.now(),
      ));
    });
  }

  void _deleteTask(Task task) {
    setState(() {
      tasks.remove(task);
    });
  }

  void _toggleTaskCompletion(Task task) {
    setState(() {
      task.toggleCompleted();
    });
  }

  void _updateFilter(bool value) {
    setState(() {
      showCompleted = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    List<Task> filteredTasks = tasks.where((task) => task.isCompleted == showCompleted).toList();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          FilterOptions(onFilterChanged: _updateFilter),
          Expanded(
            child: TaskList(
              tasks: filteredTasks,
              onTaskComplete: _toggleTaskCompletion,
              onTaskDelete: _deleteTask,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add task logic here
        },
        tooltip: 'Add Task',
        child: const Icon(Icons.add),
      ),
    );
  }
}
