import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/app/ui/widgets/gradient_background_widget.dart';
import 'package:pomoflow/app/ui/widgets/gradient_text_widget.dart';
import 'package:pomoflow/app/utils/app_validators.dart';
import 'package:pomoflow/features/forgot/controllers/forgot_controller.dart';

class ForgotScreen extends StatelessWidget {
  const ForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<ForgotController>();
    final theme = Theme.of(context);

    return GradientBackgroundWidget(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(minHeight: constraints.maxHeight),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    _buildHeader(theme),
                    const SizedBox(height: 48),
                    _buildForm(controller, theme),
                    const SizedBox(height: 24),
                    _buildFooter(theme),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildHeader(ThemeData theme) {
    return Image.asset('assets/images/img-logotipo.png', height: 45);
  }

  Widget _buildForm(ForgotController controller, ThemeData theme) {
    return Form(
      key: controller.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 8,
        children: [
          Card(
            elevation: 0,
            margin: EdgeInsets.zero,
            color: theme.colorScheme.surface,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  GradientTextWidget(text: 'Recuperar ', gradientText: 'Senha'),
                  SizedBox(height: 16),
                  Text(
                    'Digite seu e-mail abaixo para receber um link de redefinição de senha.',
                    style: theme.textTheme.bodyMedium,
                  ),
                  SizedBox(height: 32),
                  CustomTextField(
                    controller: controller.emailController,
                    labelText: 'E-mail',
                    hintText: 'seuemail@exemplo.com',
                    prefixIcon: Icons.email_outlined,
                    keyboardType: TextInputType.emailAddress,
                    validator: AppValidators.email,
                  ),

                  const SizedBox(height: 16),
                  Obx(
                    () => ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.sendPasswordResetEmail,
                      child: controller.isLoading.value
                          ? const SizedBox(
                              height: 24,
                              width: 24,
                              child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
                            )
                          : const Text('Recuperar'),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFooter(ThemeData theme) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Lembrou sua senha?', style: theme.textTheme.bodyMedium),
        TextButton(onPressed: Get.back, child: const Text('Login')),
      ],
    );
  }
}
