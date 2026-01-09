import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/core/services/snack_bar_service.dart';
import 'package:pomoflow/domain/usecases/register_usecase.dart';
import 'package:pomoflow/app/routes/app_pages.dart';

class CreateController extends GetxController {
  final SnackBarService snackBarService;
  final RegisterUseCase registerUseCase;

  CreateController({
    required this.snackBarService,
    required this.registerUseCase,
  });

  // Form
  final formKey = GlobalKey<FormState>();

  // Controllers
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  // Conditionals
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;
  final isConfirmPasswordHidden = true.obs;

  bool isFormValid() {
    if (!formKey.currentState!.validate()) return false;

    return true;
  }

  Future<void> createAccount() async {
    if (!isFormValid()) return;

    isLoading.value = true;

    final result = await registerUseCase(
      RegisterParams(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
        name: nameController.text.trim(),
      ),
    );

    result.fold(
      (failure) => snackBarService.showError(
        title: 'Erro ao Criar Conta',
        message: failure.message,
      ),
      (user) {
        Get.offAllNamed(Routes.home);
      },
    );

    isLoading.value = false;
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordHidden.value = !isConfirmPasswordHidden.value;
  }

  @override
  void onClose() {
    nameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();

    super.onClose();
  }
}
