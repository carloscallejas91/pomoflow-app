import 'package:get/get.dart';
import 'package:pomoflow/data/repositories/auth_repository_impl.dart';
import 'package:pomoflow/domain/usecases/login_with_email_usecase.dart';
import 'package:pomoflow/domain/usecases/login_with_google_usecase.dart';
import 'package:pomoflow/domain/usecases/logout_usecase.dart';
import 'package:pomoflow/domain/usecases/register_usecase.dart';
import 'package:pomoflow/modules/auth/controllers/auth_controller.dart';

class AuthBinding extends Bindings {
  @override
  void dependencies() {
    // UseCases
    Get.lazyPut(() => LoginWithGoogleUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => LoginWithEmailUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => RegisterUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => LogoutUseCase(Get.find<AuthRepositoryImpl>()));

    // Controller
    Get.lazyPut(
      () => AuthController(
        snackBarService: Get.find(),
        loginWithGoogleUseCase: Get.find(),
        loginWithEmailUseCase: Get.find(),
        registerUseCase: Get.find(),
        logoutUseCase: Get.find(),
      ),
    );
  }
}
