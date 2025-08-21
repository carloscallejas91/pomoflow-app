import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pomoflow/app/data/models/task_model.dart';
import 'package:pomoflow/app/ui/widgets/custom_text_field.dart';
import 'package:pomoflow/features/timer/controllers/timer_controller.dart';
import 'package:pomoflow/features/timer/widgets/create_task_list_sheet.dart';
import 'package:pomoflow/features/timer/widgets/delete_task_dialog.dart';
import 'package:pomoflow/features/timer/widgets/delete_task_list_dialog.dart';
import 'package:pomoflow/features/timer/widgets/edit_task_dialog.dart';

class TasksController extends GetxController {
  // Timer Controller
  final TimerController _timerController = Get.find<TimerController>();

  // Form
  final GlobalKey<FormState> taskListFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> addTaskFormKey = GlobalKey<FormState>();
  final GlobalKey<FormState> editTaskFormKey = GlobalKey<FormState>();

  // Controllers
  final listNameController = TextEditingController();
  final taskNameController = TextEditingController();

  // Lists
  final Rx<TaskList?> currentTaskList = Rx<TaskList?>(null);
  final RxList<TaskItem> tasksBeingAdded = <TaskItem>[].obs;

  void prepareForNewList() {
    listNameController.clear();
    taskNameController.clear();
    tasksBeingAdded.clear();
  }

  void prepareForEdit() {
    if (currentTaskList.value != null) {
      listNameController.text = currentTaskList.value!.name;

      tasksBeingAdded.assignAll(currentTaskList.value!.tasks.toList());
    }
  }

  void addTaskToList() {
    if (isFormValid(addTaskFormKey)) return;

    final taskName = taskNameController.text.trim();

    if (taskName.isNotEmpty) {
      tasksBeingAdded.add(TaskItem(name: taskName));
      taskNameController.clear();
    }
  }

  void updateTaskName(int index, String newName) {
    if (isFormValid(editTaskFormKey)) return;

    if (index >= 0 && index < tasksBeingAdded.length) {
      final task = tasksBeingAdded[index];

      task.name = newName;
      tasksBeingAdded[index] = task;
    }

    Get.back();
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasksBeingAdded.length) {
      tasksBeingAdded.removeAt(index);
    }
  }

  void saveTaskList() {
    if (isFormValid(taskListFormKey)) return;

    final listName = listNameController.text.trim();

    if (listName.isNotEmpty && tasksBeingAdded.isNotEmpty) {
      currentTaskList.value = TaskList(name: listName, tasks: List.from(tasksBeingAdded));

      listNameController.clear();
      tasksBeingAdded.clear();

      Get.back();
    }
  }

  void deleteCurrentList() {
    currentTaskList.value = null;

    _timerController.taskNameController.clear();
  }

  void toggleTaskCompletion(int index) {
    if (currentTaskList.value != null) {
      final task = currentTaskList.value!.tasks[index];

      task.isCompleted = !task.isCompleted;
      currentTaskList.refresh();
    }
  }

  void selectTaskForFocus(String taskName) {
    _timerController.taskNameController.text = taskName;
  }

  void showDeleteTaskListDialog() {
    Get.dialog(DeleteTaskListDialog(controller: this));
  }

  void showCreateTaskListSheet() {
    Get.bottomSheet(
      CreateTaskListSheet(controller: this),
      backgroundColor: Theme.of(Get.context!).colorScheme.surface,
      isScrollControlled: true,
    );
  }

  void showEditTaskDialog(int index) {
    Get.dialog(EditTaskDialog(controller: this, index: index));
  }

  void showDeleteTaskDialog(int index) {
    Get.dialog(DeleteTaskDialog(controller: this, index: index));
  }

  bool isFormValid(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) return true;

    return false;
  }
}
