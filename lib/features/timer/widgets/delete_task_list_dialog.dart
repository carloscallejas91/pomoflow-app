import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';

class DeleteTaskListDialog extends StatelessWidget {
  final TasksController controller;

  const DeleteTaskListDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return AlertDialog(
          title: const Text('Excluir Lista'),
          content: Text(
            'Você tem certeza que deseja excluir a lista "${controller.currentTaskList.value?.name}"? '
            'Esta ação não pode ser desfeita.',
          ),
          actions: [
            TextButton(onPressed: Get.back, child: const Text('Cancelar')),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: theme.colorScheme.error),
              child: const Text('Excluir'),
              onPressed: () {
                controller.deleteCurrentList();

                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
