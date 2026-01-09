import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/app/ui/widgets/primary_button.dart';
import 'package:pomoflow/core/utils/app_validators.dart';

class LoginFormWidget extends StatelessWidget {
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final bool isPasswordHidden;
  final bool isLoading;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onLoginPressed;
  final VoidCallback onForgotPasswordPressed;

  const LoginFormWidget({
    super.key,
    required this.emailController,
    required this.passwordController,
    required this.isPasswordHidden,
    required this.isLoading,
    required this.onTogglePasswordVisibility,
    required this.onLoginPressed,
    required this.onForgotPasswordPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomTextField(
          controller: emailController,
          labelText: 'E-mail',
          hintText: 'seuemail@exemplo.com',
          prefixIcon: Icons.email_outlined,
          keyboardType: TextInputType.emailAddress,
          validator: AppValidators.email,
        ),
        const SizedBox(height: 16),
        CustomTextField(
          controller: passwordController,
          labelText: 'Senha',
          hintText: '********',
          prefixIcon: Icons.lock_outline,
          isPassword: isPasswordHidden,
          suffixIcon: IconButton(
            icon: Icon(
              isPasswordHidden
                  ? Icons.visibility_off_outlined
                  : Icons.visibility_outlined,
            ),
            onPressed: onTogglePasswordVisibility,
          ),
          validator: AppValidators.password,
        ),
        Align(
          alignment: Alignment.centerRight,
          child: TextButton(
            onPressed: onForgotPasswordPressed,
            child: const Text('Esqueceu a senha?'),
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          width: double.infinity,
          child: PrimaryButton(
            text: 'Entrar',
            onPressed: onLoginPressed,
            isLoading: isLoading,
          ),
        ),
      ],
    );
  }
}
