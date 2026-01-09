import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DeleteListWidget extends StatelessWidget {
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;
  final VoidCallback onConfirm;

  const DeleteListWidget({
    super.key,
    required this.content,
    required this.onConfirm,
    this.title = 'Excluir Lista',
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
