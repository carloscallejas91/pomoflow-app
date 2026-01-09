import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pomoflow/domain/entities/task_entity.dart';
import 'package:pomoflow/domain/usecases/delete_task_list_usecase.dart';
import 'package:pomoflow/domain/usecases/get_task_list_usecase.dart';
import 'package:pomoflow/domain/usecases/save_task_list_usecase.dart';
import 'package:pomoflow/core/services/focus_service.dart';
import 'package:pomoflow/modules/to_do/page/to_do_page.dart';
import 'package:pomoflow/modules/to_do/widgets/delete_item_widget.dart';
import 'package:pomoflow/modules/to_do/widgets/delete_list_widget.dart';
import 'package:pomoflow/modules/to_do/widgets/edit_item_widget.dart';
import 'package:pomoflow/core/usecases/usecase.dart';

class ToDoController extends GetxController {
  final FocusService focusService;
  final SaveTaskListUseCase saveTaskListUseCase;
  final GetTaskListUseCase getTaskListUseCase;
  final DeleteTaskListUseCase deleteTaskListUseCase;

  ToDoController({
    required this.focusService,
    required this.saveTaskListUseCase,
    required this.getTaskListUseCase,
    required this.deleteTaskListUseCase,
  });

  // Form
  final taskListFormKey = GlobalKey<FormState>();
  final addTaskFormKey = GlobalKey<FormState>();
  final editTaskFormKey = GlobalKey<FormState>();

  // Controllers
  final listNameController = TextEditingController();
  final taskNameController = TextEditingController();
  final focusTaskNameController = TextEditingController();

  // Lists
  final currentTaskList = Rx<TaskListEntity?>(null);
  final tasksBeingAdded = <TaskEntity>[].obs;

  // getters
  bool get isTaskInputReadOnly =>
      currentTaskList.value != null || focusService.isSessionRunning.value;

  @override
  void onInit() {
    super.onInit();

    _setupFocusServiceListener();
    _setupFocusControllerListener();

    _loadTaskList();
  }

  void _setupFocusServiceListener() {
    // Sincronizar entrada da tarefa de foco com o serviço
    ever(focusService.focusedTaskName, (name) {
      if (focusTaskNameController.text != name) {
        focusTaskNameController.text = name;
      }
    });
  }

  void _setupFocusControllerListener() {
    focusTaskNameController.addListener(() {
      if (focusService.focusedTaskName.value != focusTaskNameController.text) {
        focusService.updateTaskName(focusTaskNameController.text);
      }
    });
  }

  Future<void> _loadTaskList() async {
    final result = await getTaskListUseCase(NoParams());
    result.fold(
      (failure) {}, // Handle error
      (taskList) {
        currentTaskList.value = taskList;
        if (taskList != null && taskList.tasks.isNotEmpty) {
          // Auto-select first task if needed or logic?
        }
      },
    );
  }

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
      tasksBeingAdded.add(TaskEntity(name: taskName));
      taskNameController.clear();
    }
  }

  void updateTaskName(int index, String newName) {
    if (isFormValid(editTaskFormKey)) return;

    if (index >= 0 && index < tasksBeingAdded.length) {
      final task = tasksBeingAdded[index];

      tasksBeingAdded[index] = task.copyWith(name: newName);
    }

    Get.back();
  }

  void deleteTask(int index) {
    if (index >= 0 && index < tasksBeingAdded.length) {
      tasksBeingAdded.removeAt(index);
    }
  }

  void saveTaskList() async {
    if (isFormValid(taskListFormKey)) return;

    final listName = listNameController.text.trim();

    if (listName.isNotEmpty) {
      currentTaskList.value = TaskListEntity(
        name: listName,
        tasks: List.from(tasksBeingAdded),
      );

      final result = await saveTaskListUseCase(
        currentTaskList.value!,
      ); // Persist properly

      result.fold(
        (failure) {
          // Show error if failed
          ScaffoldMessenger.of(Get.context!).showSnackBar(
            SnackBar(
              content: Text('Erro ao salvar: ${failure.message}'),
              backgroundColor: Colors.red,
            ),
          );
        },
        (success) {
          listNameController.clear();
          tasksBeingAdded.clear();
          Get.back();
        },
      );
    } else {
      // Validation failed or empty name (logic allows empty name but formKey might prevent it if validator is strict)
      // If isFormValid(taskListFormKey) returned false (meaning valid), we enter here.
      // Wait, logic check:
      // if (isFormValid(taskListFormKey)) return; -> if invalid, return.
      // So here strictly listName.isNotEmpty.
      // If listName is empty but validator passed (unlikely for NotEmpty), we just don't save.
      // Let's add an else to debug.
      // print('List name empty or validation failed silently?');
    }
  }

  Future<void> deleteCurrentList() async {
    await deleteTaskListUseCase(NoParams());
    currentTaskList.value = null;

    focusTaskNameController.clear();
  }

  void toggleTaskCompletion(int index) {
    if (currentTaskList.value != null) {
      var tasks = List<TaskEntity>.from(currentTaskList.value!.tasks);
      final task = tasks[index];

      tasks[index] = task.copyWith(isCompleted: !task.isCompleted);

      final updatedList = TaskListEntity(
        name: currentTaskList.value!.name,
        tasks: tasks,
      );

      currentTaskList.value = updatedList;
      saveTaskListUseCase(updatedList);
    }
  }

  void selectTaskForFocus(String taskName) {
    focusTaskNameController.text = taskName;
    // O Listener atualizará o Serviço -> TimerController
  }

  void showDeleteTaskListDialog() {
    if (currentTaskList.value == null) return;
    Get.dialog(
      DeleteListWidget(
        content:
            'Você tem certeza que deseja excluir a lista "${currentTaskList.value!.name}"? '
            'Esta ação não pode ser desfeita.',
        onConfirm: deleteCurrentList,
      ),
    );
  }

  void showCreateTaskListSheet() {
    Get.bottomSheet(
      ToDoPage(),
      backgroundColor: Theme.of(Get.context!).colorScheme.surface,
      isScrollControlled: true,
    );
  }

  void showEditTaskDialog(int index) {
    if (index < 0 || index >= tasksBeingAdded.length) return;
    Get.dialog(
      EditItemWidget(
        initialValue: tasksBeingAdded[index].name,
        formKey: editTaskFormKey,
        onSave: (newName) => updateTaskName(index, newName),
      ),
    );
  }

  void showDeleteTaskDialog(int index) {
    Get.dialog(DeleteItemWidget(onConfirm: () => deleteTask(index)));
  }

  bool isFormValid(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) return true;

    return false;
  }
}
