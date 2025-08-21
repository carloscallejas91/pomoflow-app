import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/data/enums/enums.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';

class ControlButtonsSectionWidget extends StatelessWidget {
  final TimerController controller;

  const ControlButtonsSectionWidget({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(Get.context!);

    return Obx(() {
      final isRunning = controller.timerState.value == TimerState.running;

      return Row(
        spacing: 8,
        children: [
          ElevatedButton(
            onPressed: () {},
            style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.tertiary),
            child: Icon(Icons.settings_suggest_rounded),
          ),
          Flexible(
            fit: FlexFit.tight,
            child: ElevatedButton(
              onPressed: controller.toggleTimer,
              style: ElevatedButton.styleFrom(
                backgroundColor: isRunning ? theme.colorScheme.error : theme.colorScheme.primary,
              ),
              child: Text(isRunning ? 'Pausar' : 'Iniciar'),
            ),
          ),
          ElevatedButton(
            onPressed: controller.showSkipConfirmationDialog,
            style: ElevatedButton.styleFrom(backgroundColor: theme.colorScheme.secondary),
            child: Icon(Icons.skip_next_rounded),
          ),
        ],
      );
    });
  }
}
