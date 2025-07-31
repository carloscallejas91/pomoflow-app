import 'package:get/get.dart';
import 'package:pomoflow/app/services/snack_bar_service.dart';
import 'package:pomoflow/features/auth/controllers/auth_controller.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    // Services
    Get.put<SnackBarService>(SnackBarService());

    // Controllers
    Get.put<AuthController>(AuthController(), permanent: true);
  }
}
