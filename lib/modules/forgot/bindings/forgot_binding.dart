import 'package:get/get.dart';
import 'package:pomoflow/data/repositories/auth_repository_impl.dart';
import 'package:pomoflow/domain/usecases/send_password_reset_email_usecase.dart';
import 'package:pomoflow/modules/auth/bindings/auth_binding.dart';
import 'package:pomoflow/modules/forgot/controllers/forgot_controller.dart';

class ForgotBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthRepositoryImpl>()) {
      AuthBinding().dependencies();
    }

    // Usecases
    Get.put(SendPasswordResetEmailUseCase(Get.find<AuthRepositoryImpl>()));

    // Controllers
    Get.put(
      ForgotController(
        snackBarService: Get.find(),
        sendPasswordResetEmailUseCase: Get.find(),
      ),
    );
  }
}
