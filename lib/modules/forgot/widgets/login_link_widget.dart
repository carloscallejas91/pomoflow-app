import 'package:flutter/material.dart';

class LoginLinkWidget extends StatelessWidget {
  final String text;
  final VoidCallback onLoginPressed;

  const LoginLinkWidget({
    super.key,
    required this.text,
    required this.onLoginPressed,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text, style: theme.textTheme.bodyMedium),
        TextButton(onPressed: onLoginPressed, child: const Text('Login')),
      ],
    );
  }
}
