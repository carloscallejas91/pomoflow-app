import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';

class DeleteTaskDialog extends StatelessWidget {
  final TasksController controller;
  final int index;

  const DeleteTaskDialog({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return AlertDialog(
          title: const Text('Excluir tarefa'),
          content: Text(
            'Você tem certeza que deseja excluir a tarefa? '
            'Esta ação não pode ser desfeita.',
          ),
          actions: [
            TextButton(onPressed: Get.back, child: const Text('Cancelar')),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: theme.colorScheme.error),
              child: const Text('Excluir'),
              onPressed: () {
                controller.deleteTask(index);

                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
