import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/app/ui/widgets/primary_button.dart';
import 'package:pomoflow/core/utils/app_validators.dart';

class ForgotFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final bool isLoading;
  final VoidCallback onRecoverPressed;

  const ForgotFormWidget({
    super.key,
    required this.emailController,
    required this.isLoading,
    required this.onRecoverPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        CustomTextField(
          controller: emailController,
          labelText: 'E-mail',
          hintText: 'seuemail@exemplo.com',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: AppValidators.email,
        ),
        PrimaryButton(
          text: 'Recuperar',
          onPressed: onRecoverPressed,
          isLoading: isLoading,
        ),
      ],
    );
  }
}
