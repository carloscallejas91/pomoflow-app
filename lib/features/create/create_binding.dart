import 'package:get/get.dart';
import 'package:pomoflow/features/create/controllers/create_controller.dart';

class CreateBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CreateController>(() => CreateController());
  }
}
