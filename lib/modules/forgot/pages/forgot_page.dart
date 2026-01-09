import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/app_logo_header.dart';
import 'package:pomoflow/app/ui/widgets/base_page_layout.dart';
import 'package:pomoflow/modules/forgot/controllers/forgot_controller.dart';
import 'package:pomoflow/modules/forgot/widgets/forgot_form_widget.dart';
import 'package:pomoflow/modules/forgot/widgets/forgot_welcome_widget.dart';
import 'package:pomoflow/modules/forgot/widgets/login_link_widget.dart';

class ForgotPage extends GetView<ForgotController> {
  const ForgotPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppLogoHeader(),
          const SizedBox(height: 48),
          _buildForgotFormCard(context),
          const SizedBox(height: 24),
          _buildLoginLink(),
        ],
      ),
    );
  }

  Widget _buildForgotFormCard(BuildContext context) {
    return Card(
      elevation: 0,
      margin: EdgeInsets.zero,
      color: Theme.of(context).colorScheme.surface,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const ForgotWelcomeWidget(),
            const SizedBox(height: 32),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Form(
      key: controller.formKey,
      child: Obx(
        () => ForgotFormWidget(
          emailController: controller.emailController,
          isLoading: controller.isLoading.value,
          onRecoverPressed: controller.sendPasswordResetEmail,
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return LoginLinkWidget(
      text: 'Lembrou sua senha?',
      onLoginPressed: Get.back,
    );
  }
}
