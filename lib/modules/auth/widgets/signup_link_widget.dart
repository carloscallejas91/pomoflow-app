import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupLinkWidget extends StatelessWidget {
  final String label;
  final String linkText;
  final VoidCallback onPressed;

  const SignupLinkWidget({
    super.key,
    required this.label,
    required this.linkText,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(label, style: Get.theme.textTheme.bodyMedium),
        TextButton(onPressed: onPressed, child: Text(linkText)),
      ],
    );
  }
}
