import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/core/utils/app_validators.dart';

class EditItemWidget extends StatelessWidget {
  final String initialValue;
  final GlobalKey<FormState> formKey;
  final Function(String) onSave;
  final String title;
  final String label;
  final String hint;
  final String cancelText;
  final String confirmText;

  const EditItemWidget({
    super.key,
    required this.initialValue,
    required this.formKey,
    required this.onSave,
    this.title = 'Editar Tarefa',
    this.label = 'Nome da tarefa',
    this.hint = 'Ler 1 capítulo',
    this.cancelText = 'Cancelar',
    this.confirmText = 'Salvar',
  });

  @override
  Widget build(BuildContext context) {
    final editController = TextEditingController(text: initialValue);

    return AlertDialog(
      title: Text(title),
      content: Form(
        key: formKey,
        child: CustomTextField(
          controller: editController,
          labelText: label,
          hintText: hint,
          prefixIcon: Icons.task_alt,
          keyboardType: TextInputType.text,
          validator: AppValidators.notEmpty,
        ),
      ),
      actions: [
        TextButton(onPressed: Get.back, child: Text(cancelText)),
        FilledButton(
          child: Text(confirmText),
          onPressed: () {
            onSave(editController.text.trim());
          },
        ),
      ],
    );
  }
}
