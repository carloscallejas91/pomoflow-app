import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/domain/entities/task_entity.dart';

class AddedToDoListWidget extends StatelessWidget {
  final List<TaskEntity> tasks;
  final Function(int) onEditTask;
  final Function(int) onDeleteTask;
  final String emptyMessage;

  const AddedToDoListWidget({
    super.key,
    required this.tasks,
    required this.onEditTask,
    required this.onDeleteTask,
    this.emptyMessage = 'Nenhuma tarefa adicionada ainda.',
  });

  @override
  Widget build(BuildContext context) {
    if (tasks.isEmpty) {
      return Center(
        child: Text(emptyMessage, style: Get.theme.textTheme.bodyMedium),
      );
    }

    return ListView.builder(
      itemCount: tasks.length,
      itemBuilder: (context, index) {
        final task = tasks[index];
        return ListTile(
          contentPadding: EdgeInsets.zero,
          title: Text(task.name),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit_outlined),
                onPressed: () => onEditTask(index),
              ),
              IconButton(
                icon: Icon(
                  Icons.delete_outline,
                  color: Get.theme.colorScheme.error,
                ),
                onPressed: () => onDeleteTask(index),
              ),
            ],
          ),
        );
      },
    );
  }
}
