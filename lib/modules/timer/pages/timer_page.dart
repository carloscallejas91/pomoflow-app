import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/data/enums/enums.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/modules/timer/controllers/timer_controller.dart';
import 'package:pomoflow/modules/to_do/controllers/to_do_controller.dart';
import 'package:pomoflow/modules/timer/widgets/control_buttons_section_widget.dart';
import 'package:pomoflow/modules/timer/widgets/cycle_indicators_widget.dart';
import 'package:pomoflow/modules/timer/widgets/to_do_list_widget.dart';
import 'package:pomoflow/modules/timer/widgets/timer_widget.dart';
import 'package:pomoflow/modules/timer/widgets/skip_confirmation_dialog.dart';

class TimerPage extends GetView<TimerController> {
  const TimerPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => CycleIndicatorsWidget(
            currentCycle: controller.currentCycle.value,
            focusLabel: 'Foco',
            shortBreakLabel: 'Descanso Curto',
            longBreakLabel: 'Descanso Longo',
          ),
        ),
        const SizedBox(height: 48),
        Obx(
          () => TimerWidget(
            progress: controller.progress.value,
            timeString: controller.timeStr.value,
          ),
        ),
        const SizedBox(height: 24),
        Obx(() {
          final todoController = Get.find<ToDoController>();
          final isTaskListEmpty = todoController.currentTaskList.value == null;
          final isSessionRunning =
              controller.timerState.value == TimerState.running;

          return CustomTextField(
            controller: controller.focusTaskNameController,
            labelText: 'Nome da Tarefa',
            hintText: 'Em qual tarefa você vai focar?',
            prefixIcon: Icons.task_alt_outlined,
            readOnly: !isTaskListEmpty || isSessionRunning,
            suffixIcon: IconButton(
              icon: const Icon(Icons.playlist_add),
              tooltip: 'Criar/Editar Lista',
              onPressed: () {
                todoController.prepareForEdit();
                todoController.showCreateTaskListSheet();
              },
            ),
          );
        }),
        const SizedBox(height: 16),
        Obx(() {
          final todoController = Get.find<ToDoController>();

          if (todoController.currentTaskList.value == null) {
            return const SizedBox.shrink();
          }

          return ToDoListWidget(
            taskList: todoController.currentTaskList.value!,
            onEditPressed: () {
              todoController.prepareForEdit();
              todoController.showCreateTaskListSheet();
            },
            onDeletePressed: todoController.showDeleteTaskListDialog,
            onTaskToggle: todoController.toggleTaskCompletion,
            onTaskFocus: controller.selectTaskForFocus,
          );
        }),
        const SizedBox(height: 24),
        Obx(
          () => ControlButtonsSectionWidget(
            isRunning: controller.timerState.value == TimerState.running,
            settingsIcon: Icons.settings_suggest_rounded,
            skipIcon: Icons.skip_next_rounded,
            onPauseOrStartPressed: controller.toggleTimer,
            onSkipPressed: () {
              if (controller.validateTaskForSkip()) {
                Get.dialog(
                  SkipConfirmationDialog(
                    title: 'Pular Ciclo',
                    content:
                        'Você tem certeza que deseja '
                        'avançar para o próximo estágio?',
                    onConfirm: controller.skipToNextCycle,
                  ),
                );
              }
            },
            onSettingsPressed: () {},
          ),
        ),
      ],
    );
  }
}
