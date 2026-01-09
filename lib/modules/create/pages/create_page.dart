import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/ui/widgets/app_logo_header.dart';
import 'package:pomoflow/app/ui/widgets/base_page_layout.dart';
import 'package:pomoflow/modules/create/controllers/create_controller.dart';
import 'package:pomoflow/modules/create/widgets/create_form_widget.dart';
import 'package:pomoflow/modules/create/widgets/create_welcome_widget.dart';
import 'package:pomoflow/modules/create/widgets/login_link_widget.dart';

class CreatePage extends GetView<CreateController> {
  const CreatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BasePageLayout(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const AppLogoHeader(),
          const SizedBox(height: 48),
          _buildCreateFormCard(context),
          const SizedBox(height: 24),
          _buildLoginLink(),
        ],
      ),
    );
  }

  Widget _buildCreateFormCard(BuildContext context) {
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
            const CreateWelcomeWidget(),
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
        () => CreateFormWidget(
          nameController: controller.nameController,
          emailController: controller.emailController,
          passwordController: controller.passwordController,
          confirmPasswordController: controller.confirmPasswordController,
          isPasswordHidden: controller.isPasswordHidden.value,
          isConfirmPasswordHidden: controller.isConfirmPasswordHidden.value,
          isLoading: controller.isLoading.value,
          onTogglePasswordVisibility: controller.togglePasswordVisibility,
          onToggleConfirmPasswordVisibility:
              controller.toggleConfirmPasswordVisibility,
          onCreateAccountPressed: controller.createAccount,
        ),
      ),
    );
  }

  Widget _buildLoginLink() {
    return LoginLinkWidget(
      text: 'Já tenho uma conta?',
      onLoginPressed: Get.back,
    );
  }
}
