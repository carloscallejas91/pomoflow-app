import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/routes/app_pages.dart';
import 'package:pomoflow/modules/auth/controllers/auth_controller.dart';
import 'package:pomoflow/app/ui/widgets/app_logo_header.dart';
import 'package:pomoflow/app/ui/widgets/base_page_layout.dart';
import 'package:pomoflow/modules/auth/widgets/login_form_widget.dart';
import 'package:pomoflow/modules/auth/widgets/login_welcome_widget.dart';
import 'package:pomoflow/modules/auth/widgets/signup_link_widget.dart';
import 'package:pomoflow/modules/auth/widgets/social_login_widget.dart';

class AuthPage extends GetView<AuthController> {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppLogoHeader(),
          const SizedBox(height: 48),
          _buildLoginCard(),
          const SizedBox(height: 24),
          _buildSignupLink(),
        ],
      ),
    );
  }

  Widget _buildLoginCard() {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Get.theme.colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const LoginWelcomeWidget(),
            const SizedBox(height: 32),
            _buildForm(),
            const SizedBox(height: 16),
            Obx(
              () => SocialLoginWidget(
                isLoading: controller.isLoading.value,
                onGooglePressed: controller.signInWithGoogle,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      child: Obx(
        () => LoginFormWidget(
          emailController: controller.emailController,
          passwordController: controller.passwordController,
          isPasswordHidden: controller.isPasswordHidden.value,
          isLoading: controller.isLoading.value,
          onTogglePasswordVisibility: controller.togglePasswordVisibility,
          onLoginPressed: controller.signInWithEmail,
          onForgotPasswordPressed: () => Get.toNamed(Routes.forgotPassword),
        ),
      ),
    );
  }

  Widget _buildSignupLink() {
    return SignupLinkWidget(
      label: 'Não tem uma conta?',
      linkText: 'Crie uma agora',
      onPressed: () => Get.toNamed(Routes.createAccount),
    );
  }
}
