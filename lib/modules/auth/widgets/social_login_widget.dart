import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  final bool isLoading;
  final VoidCallback onGooglePressed;

  const SocialLoginWidget({
    super.key,
    required this.isLoading,
    required this.onGooglePressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Row(
          children: [
            Expanded(child: Divider()),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Text("OU"),
            ),
            Expanded(child: Divider()),
          ],
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            onPressed: isLoading ? null : onGooglePressed,
            icon: const Icon(Icons.login),
            label: const Text("Entrar com Google"),
          ),
        ),
      ],
    );
  }
}
