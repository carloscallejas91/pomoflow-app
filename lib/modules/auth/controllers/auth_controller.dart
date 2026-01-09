import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/routes/app_pages.dart';
import 'package:pomoflow/core/services/snack_bar_service.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/domain/usecases/login_with_email_usecase.dart';
import 'package:pomoflow/domain/usecases/login_with_google_usecase.dart';
import 'package:pomoflow/domain/usecases/logout_usecase.dart';
import 'package:pomoflow/domain/usecases/register_usecase.dart';

class AuthController extends GetxController {
  final SnackBarService snackBarService;
  final LoginWithGoogleUseCase loginWithGoogleUseCase;
  final LoginWithEmailUseCase loginWithEmailUseCase;
  final RegisterUseCase registerUseCase;
  final LogoutUseCase logoutUseCase;

  AuthController({
    required this.snackBarService,
    required this.loginWithGoogleUseCase,
    required this.loginWithEmailUseCase,
    required this.registerUseCase,
    required this.logoutUseCase,
  });

  // Form
  final formKey = GlobalKey<FormState>();

  // Controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  // Conditionals
  final isLoading = false.obs;
  final isPasswordHidden = true.obs;

  bool isFormValid() {
    if (!formKey.currentState!.validate()) return false;
    return true;
  }

  Future<void> signInWithEmail() async {
    if (!isFormValid()) return;

    isLoading.value = true;

    final result = await loginWithEmailUseCase(
      LoginWithEmailParams(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      ),
    );

    result.fold(
      (failure) => snackBarService.showError(
        title: 'Erro de Autenticação',
        message: failure.message,
      ),
      (user) {
        Get.offAllNamed(Routes.home);
      },
    );

    isLoading.value = false;
  }

  Future<void> signInWithGoogle() async {
    isLoading.value = true;

    final result = await loginWithGoogleUseCase(NoParams());

    result.fold(
      (failure) => snackBarService.showError(
        title: 'Erro de Autenticação',
        message: failure.message,
      ),
      (user) {
        Get.offAllNamed(Routes.home);
      },
    );

    isLoading.value = false;
  }

  Future<void> signOut() async {
    await logoutUseCase(NoParams());

    Get.offAllNamed(Routes.auth);
  }

  void togglePasswordVisibility() {
    isPasswordHidden.value = !isPasswordHidden.value;
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();

    super.onClose();
  }
}
