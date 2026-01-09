import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/modules/to_do/controllers/to_do_controller.dart';
import 'package:pomoflow/modules/to_do/widgets/added_to_do_list_widget.dart';
import 'package:pomoflow/modules/to_do/widgets/to_do_form_widget.dart';

class ToDoPage extends GetView<ToDoController> {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.only(
            left: 16,
            top: 32,
            right: 16,
            bottom: 16,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Lista de tarefas',
                style: Get.theme.textTheme.headlineSmall,
              ),
              const SizedBox(height: 16),
              ToDoFormWidget(
                listFormKey: controller.taskListFormKey,
                taskFormKey: controller.addTaskFormKey,
                listNameController: controller.listNameController,
                taskNameController: controller.taskNameController,
                onAddTaskPressed: controller.addTaskToList,
              ),
              const SizedBox(height: 16),
              Expanded(
                child: Obx(
                  () => AddedToDoListWidget(
                    tasks: controller.tasksBeingAdded.toList(),
                    onEditTask: controller.showEditTaskDialog,
                    onDeleteTask: controller.showDeleteTaskDialog,
                  ),
                ),
              ),
              ElevatedButton(
                onPressed: controller.saveTaskList,
                child: const Text('Salvar'),
              ),
            ],
          ),
        );
      },
    );
  }
}
