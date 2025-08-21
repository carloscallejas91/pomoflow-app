import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';

class SkipConfirmationDialog extends StatelessWidget {
  final TimerController controller;

  const SkipConfirmationDialog({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Pular Ciclo'),
      content: const Text('Você tem certeza que deseja avançar para o próximo estágio?'),
      actions: [
        TextButton(child: const Text('Cancelar'), onPressed: () => Get.back(closeOverlays: true)),
        FilledButton(
          child: const Text('Avançar'),
          onPressed: () {
            Get.back(closeOverlays: true);

            controller.skipToNextCycle();
          },
        ),
      ],
    );
  }
}
