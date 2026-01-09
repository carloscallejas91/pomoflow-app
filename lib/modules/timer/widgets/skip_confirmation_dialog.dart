import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SkipConfirmationDialog extends StatelessWidget {
  final VoidCallback onConfirm;
  final String title;
  final String content;
  final String cancelText;
  final String confirmText;

  const SkipConfirmationDialog({
    super.key,
    required this.onConfirm,
    required this.title,
    required this.content,
    this.cancelText = 'Cancelar',
    this.confirmText = 'Avançar',
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: Text(content),
      actions: [
        TextButton(
          child: Text(cancelText),
          onPressed: () => Get.back(closeOverlays: true),
        ),
        FilledButton(
          child: Text(confirmText),
          onPressed: () {
            Get.back(closeOverlays: true);
            onConfirm();
          },
        ),
      ],
    );
  }
}
