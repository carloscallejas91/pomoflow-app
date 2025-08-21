import 'package:get/get.dart';
import 'package:pomoflow/features/home/controllers/home_controller.dart';
import 'package:pomoflow/features/timer/controllers/task_controller.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController(), fenix: true);

    Get.lazyPut<TimerController>(() => TimerController());
    Get.lazyPut<TasksController>(() => TasksController());
  }
}
