import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/app/utils/app_validators.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';

class EditTaskDialog extends StatelessWidget {
  final TasksController controller;
  final int index;

  const EditTaskDialog({super.key, required this.controller, required this.index});

  @override
  Widget build(BuildContext context) {
    final editController = TextEditingController(text: controller.tasksBeingAdded[index].name);

    return AlertDialog(
      title: const Text('Editar Tarefa'),
      content: Form(
        key: controller.editTaskFormKey,
        child: CustomTextField(
          controller: editController,
          labelText: 'Nome da tarefa',
          hintText: 'Ler 1 capítulo',
          prefixIcon: Icons.task_alt,
          keyboardType: TextInputType.text,
          validator: AppValidators.notEmpty,
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: const Text('Cancelar')),
        FilledButton(
          child: const Text('Salvar'),
          onPressed: () {
            final newName = editController.text.trim();

            controller.updateTaskName(index, newName);
          },
        ),
      ],
    );
  }
}
