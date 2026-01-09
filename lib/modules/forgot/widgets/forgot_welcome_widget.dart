import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/widgets/gradient_text_widget.dart';

class ForgotWelcomeWidget extends StatelessWidget {
  const ForgotWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GradientTextWidget(text: 'Recuperar ', gradientText: 'senha'),
        const SizedBox(height: 16),
        Text(
          'Digite seu e-mail abaixo para receber um link de redefinição de senha.',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
