import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/data/enums/enums.dart';
import 'package:pomoflow/app/data/models/task_model.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';

class TaskSectionWidget extends StatelessWidget {
  final TimerController timerController;
  final TasksController tasksController;

  const TaskSectionWidget({
    super.key,
    required this.timerController,
    required this.tasksController,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildTaskInput(timerController),
        const SizedBox(height: 16),
        _buildTaskSection(timerController, tasksController),
      ],
    );
  }

  Widget _buildTaskInput(TimerController timerController) {
    return Obx(
      () => CustomTextField(
        controller: timerController.taskNameController,
        labelText: 'Nome da Tarefa',
        hintText: 'Em qual tarefa você vai focar?',
        prefixIcon: Icons.task_alt_outlined,
        readOnly:
            (tasksController.currentTaskList.value?.name != null ||
            timerController.timerState.value == TimerState.running),
      ),
    );
  }

  Widget _buildTaskSection(TimerController timerController, TasksController tasksController) {
    return Obx(() {
      if (tasksController.currentTaskList.value != null) {
        return _buildTaskListView(tasksController);
      }

      return SizedBox.shrink();
    });
  }

  Widget _buildTaskListView(TasksController controller) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return Container(
          height: 180,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: theme.colorScheme.surface,
            borderRadius: BorderRadius.circular(8),
          ),
          child: Obx(() {
            final taskList = controller.currentTaskList.value!;

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildTaskHeader(taskList, theme, controller),
                const Divider(),
                _buildTaskList(taskList, controller),
              ],
            );
          }),
        );
      },
    );
  }

  Widget _buildTaskHeader(TaskList taskList, ThemeData theme, TasksController controller) {
    return Row(
      children: [
        Expanded(
          child: Text(
            taskList.name,
            style: theme.textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        IconButton(
          icon: const Icon(Icons.edit_outlined),
          onPressed: () {
            controller.prepareForEdit();
            controller.showCreateTaskListSheet();
          },
          tooltip: 'Editar lista',
          visualDensity: VisualDensity.compact,
        ),
        IconButton(
          icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
          onPressed: controller.showDeleteTaskListDialog,
          tooltip: 'Excluir lista',
          visualDensity: VisualDensity.compact,
        ),
      ],
    );
  }

  Widget _buildTaskList(TaskList taskList, TasksController controller) {
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
              style: TextStyle(decoration: task.isCompleted ? TextDecoration.lineThrough : null),
            ),
            value: task.isCompleted,
            onChanged: (value) => controller.toggleTaskCompletion(index),
            secondary: IconButton(
              visualDensity: VisualDensity.compact,
              icon: const Icon(Icons.center_focus_strong_outlined),
              onPressed: () => controller.selectTaskForFocus(task.name),
            ),
          );
        },
      ),
    );
  }
}
