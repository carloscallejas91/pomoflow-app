import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/widgets/gradient_text_widget.dart';

class CreateWelcomeWidget extends StatelessWidget {
  const CreateWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        GradientTextWidget(text: 'Criar ', gradientText: 'conta'),
        const SizedBox(height: 16),
        Text(
          'Organize seu tempo, transforme seu dia.',
          style: theme.textTheme.bodyMedium,
        ),
      ],
    );
  }
}
