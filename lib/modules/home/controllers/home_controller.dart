import 'package:get/get.dart';
import 'package:pomoflow/domain/entities/user_entity.dart';
import 'package:pomoflow/domain/usecases/get_current_user_usecase.dart';
import 'package:pomoflow/domain/usecases/logout_usecase.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/app/routes/app_pages.dart';
import 'package:pomoflow/modules/to_do/controllers/to_do_controller.dart';

class HomeController extends GetxController {
  final LogoutUseCase logoutUseCase;
  final GetCurrentUserUseCase getCurrentUserUseCase;

  HomeController({
    required this.logoutUseCase,
    required this.getCurrentUserUseCase,
  });

  final selectedIndex = 0.obs;
  final user = Rx<UserEntity?>(null);

  @override
  void onInit() {
    super.onInit();

    fetchCurrentUser();
  }

  void changePage(int index) {
    selectedIndex.value = index;
  }

  Future<void> fetchCurrentUser() async {
    final result = await getCurrentUserUseCase(NoParams());

    result.fold((failure) => null, (userEntity) => user.value = userEntity);
  }

  Future<void> logout() async {
    await logoutUseCase(NoParams());

    Get.offAllNamed(Routes.auth);
  }

  void openCreateTaskSheet() {
    Get.find<ToDoController>().showCreateTaskListSheet();
  }
}
