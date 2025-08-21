import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/app/utils/app_validators.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';

class CreateTaskListSheet extends StatelessWidget {
  final TasksController controller;

  const CreateTaskListSheet({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final theme = Theme.of(context);

        return Container(
          height: MediaQuery.of(context).size.height * 0.9,
          padding: const EdgeInsets.only(left: 16, top: 32, right: 16, bottom: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('Lista de tarefas', style: theme.textTheme.headlineSmall),
              const SizedBox(height: 16),
              _buildTaskForm(theme),
              const SizedBox(height: 16),
              _buildTaskList(theme),
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

  Widget _buildTaskForm(ThemeData theme) {
    return Form(
      key: controller.taskListFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: controller.listNameController,
            labelText: 'Nome da lista',
            hintText: 'Ler o livro',
            prefixIcon: Icons.category_outlined,
            keyboardType: TextInputType.text,
            validator: AppValidators.notEmpty,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Form(
                  key: controller.addTaskFormKey,
                  child: CustomTextField(
                    controller: controller.taskNameController,
                    labelText: 'Nome da Tarefa',
                    hintText: 'Ler 1 capítulo',
                    prefixIcon: Icons.add_task_outlined,
                    keyboardType: TextInputType.text,
                    validator: AppValidators.notEmpty,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: controller.addTaskToList,
                color: theme.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTaskList(ThemeData theme) {
    return Expanded(
      child: Obx(() {
        if (controller.tasksBeingAdded.isEmpty) {
          return Center(
            child: Text('Nenhuma tarefa adicionada ainda.', style: theme.textTheme.bodyMedium),
          );
        }

        return ListView.builder(
          itemCount: controller.tasksBeingAdded.length,
          itemBuilder: (context, index) {
            final task = controller.tasksBeingAdded[index];
            return ListTile(
              contentPadding: EdgeInsets.zero,
              title: Text(task.name),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit_outlined),
                    onPressed: () => controller.showEditTaskDialog(index),
                  ),
                  IconButton(
                    icon: Icon(Icons.delete_outline, color: theme.colorScheme.error),
                    onPressed: () => controller.showDeleteTaskDialog(index),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
