class TaskItem {
  String name;
  bool isCompleted;

  TaskItem({required this.name, this.isCompleted = false});
}

class TaskList {
  String name;
  List<TaskItem> tasks;

  TaskList({required this.name, required this.tasks});
}