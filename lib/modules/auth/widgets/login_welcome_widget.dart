import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/gradient_text_widget.dart';

class LoginWelcomeWidget extends StatelessWidget {
  const LoginWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GradientTextWidget(text: 'Seja ', gradientText: 'bem-vindo!'),
        const SizedBox(height: 16),
        Text(
          'Faça login para sincronizar suas tarefas e seu progresso.',
          style: Get.theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
