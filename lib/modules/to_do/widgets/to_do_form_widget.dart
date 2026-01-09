import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/core/utils/app_validators.dart';

class ToDoFormWidget extends StatelessWidget {
  final GlobalKey<FormState> listFormKey;
  final GlobalKey<FormState> taskFormKey;
  final TextEditingController listNameController;
  final TextEditingController taskNameController;
  final VoidCallback onAddTaskPressed;

  final String listNameLabel;
  final String listNameHint;
  final String taskNameLabel;
  final String taskNameHint;

  const ToDoFormWidget({
    super.key,
    required this.listFormKey,
    required this.taskFormKey,
    required this.listNameController,
    required this.taskNameController,
    required this.onAddTaskPressed,
    this.listNameLabel = 'Nome da lista',
    this.listNameHint = 'Ler o livro',
    this.taskNameLabel = 'Nome da Tarefa',
    this.taskNameHint = 'Ler 1 capítulo',
  });

  @override
  Widget build(BuildContext context) {
    return Form(
      key: listFormKey,
      child: Column(
        children: [
          CustomTextField(
            controller: listNameController,
            labelText: listNameLabel,
            hintText: listNameHint,
            prefixIcon: Icons.category_outlined,
            keyboardType: TextInputType.text,
            validator: AppValidators.notEmpty,
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                child: Form(
                  key: taskFormKey,
                  child: CustomTextField(
                    controller: taskNameController,
                    labelText: taskNameLabel,
                    hintText: taskNameHint,
                    prefixIcon: Icons.add_task_outlined,
                    keyboardType: TextInputType.text,
                    validator: AppValidators.notEmpty,
                  ),
                ),
              ),
              IconButton(
                icon: const Icon(Icons.add_circle),
                onPressed: onAddTaskPressed,
                color: Get.theme.colorScheme.primary,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
