import 'package:get/get.dart';
import 'package:pomoflow/domain/usecases/register_usecase.dart';
import 'package:pomoflow/modules/auth/bindings/auth_binding.dart';
import 'package:pomoflow/modules/create/controllers/create_controller.dart';
import 'package:pomoflow/data/repositories/auth_repository_impl.dart';

class CreateBinding extends Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthRepositoryImpl>()) {
      AuthBinding().dependencies();
    }

    // UseCases
    Get.put(RegisterUseCase(Get.find<AuthRepositoryImpl>()));

    // Controller
    Get.put(
      CreateController(
        snackBarService: Get.find(),
        registerUseCase: Get.find(),
      ),
    );
  }
}
