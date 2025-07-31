import 'package:get/get.dart';
import 'package:pomoflow/features/forgot/controllers/forgot_controller.dart';

class ForgotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ForgotController>(() => ForgotController());
  }
}
