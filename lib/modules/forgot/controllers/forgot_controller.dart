import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/core/services/snack_bar_service.dart';
import 'package:pomoflow/domain/usecases/send_password_reset_email_usecase.dart';

class ForgotController extends GetxController {
  final SnackBarService snackBarService;
  final SendPasswordResetEmailUseCase sendPasswordResetEmailUseCase;

  ForgotController({
    required this.snackBarService,
    required this.sendPasswordResetEmailUseCase,
  });

  // Form
  final formKey = GlobalKey<FormState>();

  // Controllers
  final emailController = TextEditingController();

  // Conditionals
  final isLoading = false.obs;

  bool isFormValid() {
    if (!formKey.currentState!.validate()) return false;
    return true;
  }

  Future<void> sendPasswordResetEmail() async {
    if (!isFormValid()) return;

    isLoading.value = true;

    final result = await sendPasswordResetEmailUseCase(
      emailController.text.trim(),
    );

    result.fold(
      (failure) =>
          snackBarService.showError(title: 'Erro', message: failure.message),
      (_) {
        snackBarService.showSuccess(
          title: 'Sucesso!',
          message:
              'Um e-mail de recuperação foi enviado para ${emailController.text.trim()}. Verifique sua caixa de entrada.',
        );
        Get.back();
      },
    );

    isLoading.value = false;
  }

  @override
  void onClose() {
    emailController.dispose();

    super.onClose();
  }
}
