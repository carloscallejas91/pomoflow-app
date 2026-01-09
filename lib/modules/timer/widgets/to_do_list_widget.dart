import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/domain/entities/task_entity.dart';

class ToDoListWidget extends StatelessWidget {
  final TaskListEntity taskList;
  final VoidCallback onEditPressed;
  final VoidCallback onDeletePressed;
  final Function(int) onTaskToggle;
  final Function(String) onTaskFocus;

  const ToDoListWidget({
    super.key,
    required this.taskList,
    required this.onEditPressed,
    required this.onDeletePressed,
    required this.onTaskToggle,
    required this.onTaskFocus,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Get.theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [_buildTaskHeader(), const Divider(), _buildTaskList()],
      ),
    );
  }

  Widget _buildTaskHeader() {
    return Row(
      children: [
        Expanded(
          child: Text(
            taskList.name,
            style: Get.theme.textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: onEditPressed,
          tooltip: 'Editar lista',
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          icon: Icon(Icons.delete_outline, color: Get.theme.colorScheme.error),
          onPressed: onDeletePressed,
          tooltip: 'Excluir lista',
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }

  Widget _buildTaskList() {
    return Expanded(
      child: ListView.builder(
        itemCount: taskList.tasks.length,
        itemBuilder: (context, index) {
          final task = taskList.tasks[index];
          return CheckboxListTile(
            visualDensity: VisualDensity.compact,
            contentPadding: EdgeInsets.zero,
            title: Text(
              task.name,
              style: TextStyle(
                decoration: task.isCompleted
                    ? TextDecoration.lineThrough
                    : null,
              ),
            ),
            value: task.isCompleted,
            onChanged: (value) => onTaskToggle(index),
            secondary: IconButton(
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.center_focus_strong_outlined),
              onPressed: () => onTaskFocus(task.name),
            ),
          );
        },
      ),
    );
  }
}
