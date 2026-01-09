import 'package:get/get.dart';
import 'package:pomoflow/core/services/focus_service.dart';
import 'package:pomoflow/data/repositories/auth_repository_impl.dart';
import 'package:pomoflow/data/repositories/task_repository_impl.dart';
import 'package:pomoflow/domain/repositories/task_repository.dart';
import 'package:pomoflow/domain/usecases/delete_task_list_usecase.dart';
import 'package:pomoflow/domain/usecases/get_current_user_usecase.dart';
import 'package:pomoflow/domain/usecases/get_task_list_usecase.dart';
import 'package:pomoflow/domain/usecases/logout_usecase.dart';
import 'package:pomoflow/domain/usecases/save_task_list_usecase.dart';
import 'package:pomoflow/modules/auth/bindings/auth_binding.dart';
import 'package:pomoflow/modules/home/controllers/home_controller.dart';
import 'package:pomoflow/modules/to_do/controllers/to_do_controller.dart';
import 'package:pomoflow/modules/timer/controllers/timer_controller.dart';

class HomeBinding implements Bindings {
  @override
  void dependencies() {
    if (!Get.isRegistered<AuthRepositoryImpl>()) {
      AuthBinding().dependencies();
    }

    // Shared Services
    Get.put(FocusService(), permanent: true);

    // -- Home --
    // Usecases
    Get.lazyPut(() => LogoutUseCase(Get.find<AuthRepositoryImpl>()));
    Get.lazyPut(() => GetCurrentUserUseCase(Get.find<AuthRepositoryImpl>()));

    // Controllers
    Get.lazyPut<HomeController>(
      () => HomeController(
        logoutUseCase: Get.find(),
        getCurrentUserUseCase: Get.find(),
      ),
      fenix: true,
    );

    // -- Timer --
    // Timer
    Get.lazyPut<TimerController>(
      () => TimerController(
        snackBarService: Get.find(),
        focusService: Get.find(),
      ),
    );

    // -- Tasks --
    // Repositories
    Get.put<TaskRepository>(TaskRepositoryImpl(), permanent: true);

    // Usecases
    Get.lazyPut(() => SaveTaskListUseCase(Get.find()));
    Get.lazyPut(() => GetTaskListUseCase(Get.find()));
    Get.lazyPut(() => DeleteTaskListUseCase(Get.find()));

    // Controllers
    Get.lazyPut<ToDoController>(
      () => ToDoController(
        focusService: Get.find(),
        saveTaskListUseCase: Get.find(),
        getTaskListUseCase: Get.find(),
        deleteTaskListUseCase: Get.find(),
      ),
    );
  }
}
