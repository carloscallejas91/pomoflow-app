import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteItemWidget extends StatelessWidget {
  final VoidCallback onConfirm;

  final String title;
  final String content;
  final String cancelText;
  final String confirmText;

  const DeleteItemWidget({
    super.key,
    required this.onConfirm,
    this.title = 'Excluir tarefa',
    this.content =
        'Você tem certeza que deseja excluir a tarefa? '
        'Esta ação não pode ser desfeita.',
    this.cancelText = 'Cancelar',
    this.confirmText = 'Excluir',
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(content),
          actions: [
            TextButton(onPressed: Get.back, child: Text(cancelText)),
            FilledButton(
              style: FilledButton.styleFrom(
                backgroundColor: Get.theme.colorScheme.error,
              ),
              child: Text(confirmText),
              onPressed: () {
                onConfirm();
                Get.back();
              },
            ),
          ],
        );
      },
    );
  }
}
