import 'package:flutter/material.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/app/ui/widgets/primary_button.dart';
import 'package:pomoflow/core/utils/app_validators.dart';

class CreateFormWidget extends StatelessWidget {
  final TextEditingController nameController;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final bool isPasswordHidden;
  final bool isConfirmPasswordHidden;
  final bool isLoading;
  final VoidCallback onTogglePasswordVisibility;
  final VoidCallback onToggleConfirmPasswordVisibility;
  final VoidCallback onCreateAccountPressed;

  const CreateFormWidget({
    super.key,
    required this.nameController,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
    required this.isPasswordHidden,
    required this.isConfirmPasswordHidden,
    required this.isLoading,
    required this.onTogglePasswordVisibility,
    required this.onToggleConfirmPasswordVisibility,
    required this.onCreateAccountPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      spacing: 16,
      children: [
        _buildNameField(),
        _buildEmailField(),
        _buildPasswordField(),
        _buildConfirmPasswordField(),
        PrimaryButton(
          text: 'Criar Conta',
          onPressed: onCreateAccountPressed,
          isLoading: isLoading,
        ),
      ],
    );
  }

  CustomTextField _buildNameField() {
    return CustomTextField(
      controller: nameController,
      labelText: 'Nome',
      hintText: 'Como podemos te chamar?',
      prefixIcon: Icons.person_outline,
      validator: (value) => AppValidators.notEmpty(
        value,
        message: 'O campo de nome é obrigatório.',
      ),
    );
  }

  CustomTextField _buildEmailField() {
    return CustomTextField(
      controller: emailController,
      labelText: 'E-mail',
      hintText: 'seuemail@exemplo.com',
      prefixIcon: Icons.email_outlined,
      keyboardType: TextInputType.emailAddress,
      validator: AppValidators.email,
    );
  }

  CustomTextField _buildPasswordField() {
    return CustomTextField(
      controller: passwordController,
      labelText: 'Senha',
      hintText: 'Crie uma senha forte',
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
      validator: AppValidators.strongPassword,
    );
  }

  CustomTextField _buildConfirmPasswordField() {
    return CustomTextField(
      controller: confirmPasswordController,
      labelText: 'Confirmar Senha',
      hintText: 'Repita a senha',
      prefixIcon: Icons.lock_outline,
      isPassword: isConfirmPasswordHidden,
      suffixIcon: IconButton(
        icon: Icon(
          isConfirmPasswordHidden
              ? Icons.visibility_off_outlined
              : Icons.visibility_outlined,
        ),
        onPressed: onToggleConfirmPasswordVisibility,
      ),
      validator: (value) =>
          AppValidators.confirmPassword(passwordController.text, value),
    );
  }
}
