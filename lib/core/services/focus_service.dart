import 'package:get/get.dart';

class FocusService extends GetxService {
  final RxString focusedTaskName = ''.obs;
  final RxBool isSessionRunning = false.obs;

  void updateTaskName(String name) {
    focusedTaskName.value = name;
  }

  void setSessionRunning(bool isRunning) {
    isSessionRunning.value = isRunning;
  }
}
