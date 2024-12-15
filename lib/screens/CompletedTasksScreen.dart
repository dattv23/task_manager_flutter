import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../store/TaskProvider.dart';
import '../models/Task.dart';

class CompletedTasksScreen extends StatelessWidget {
  const CompletedTasksScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final taskProvider = Provider.of<TaskProvider>(context, listen: false);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Completed Tasks'),
      ),
      body: StreamBuilder<List<Task>>(
        stream: taskProvider.completedTasksStream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
              child: Text(
                'No completed tasks yet',
                style: TextStyle(fontSize: 18),
              ),
            );
          }

          final completedTasks = snapshot.data!;

          return ListView.builder(
            itemCount: completedTasks.length,
            itemBuilder: (context, index) {
              final task = completedTasks[index];
              return ListTile(
                title: Text(
                  task.title,
                  style: const TextStyle(
                    decoration: TextDecoration.lineThrough,
                    color: Colors.grey,
                  ),
                ),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () {
                    taskProvider.removeTask(task);
                  },
                ),
              );
            },
          );
        },
      ),
    );
  }
}
