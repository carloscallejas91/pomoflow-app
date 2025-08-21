import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';
import 'package:pomoflow/features/timer/widgets/control_buttons_section_widget.dart';
import 'package:pomoflow/features/timer/widgets/cycle_indicators_widget.dart';
import 'package:pomoflow/features/timer/widgets/task_section_widget.dart';
import 'package:pomoflow/features/timer/widgets/timer_widget.dart';

class TimerScreen extends StatelessWidget {
  const TimerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final timerController = Get.find<TimerController>();
    final tasksController = Get.find<TasksController>();

    return Column(
      children: [
        CycleIndicatorsWidget(controller: timerController),
        const SizedBox(height: 48),
        TimerWidget(controller: timerController),
        const SizedBox(height: 24),
        TaskSectionWidget(timerController: timerController, tasksController: tasksController),
        const SizedBox(height: 24),
        ControlButtonsSectionWidget(controller: timerController),
      ],
    );
  }
}
