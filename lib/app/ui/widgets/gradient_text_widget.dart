import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class GradientTextWidget extends StatelessWidget {
  final String text;
  final String gradientText;
  final TextStyle? style;
  final Gradient? gradient;

  const GradientTextWidget({
    super.key,
    required this.text,
    required this.gradientText,
    this.style,
    this.gradient,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          text,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface,
            fontWeight: FontWeight.bold,
          ),
        ),
        GradientText(
          gradientText,
          style: theme.textTheme.headlineSmall?.copyWith(fontWeight: FontWeight.bold),
          colors: [theme.colorScheme.secondary, theme.colorScheme.tertiary],
        ),
      ],
    );
  }
}
