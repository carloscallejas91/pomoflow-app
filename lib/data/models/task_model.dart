import 'package:pomoflow/domain/entities/task_entity.dart';

class TaskItemModel extends TaskEntity {
  const TaskItemModel({required super.name, super.isCompleted});

  factory TaskItemModel.fromEntity(TaskEntity entity) {
    return TaskItemModel(name: entity.name, isCompleted: entity.isCompleted);
  }

  factory TaskItemModel.fromJson(Map<String, dynamic> json) {
    return TaskItemModel(
      name: json['name'] as String,
      isCompleted: json['isCompleted'] as bool? ?? false,
    );
  }

  Map<String, dynamic> toJson() {
    return {'name': name, 'isCompleted': isCompleted};
  }
}

class TaskListModel extends TaskListEntity {
  const TaskListModel({required super.name, required super.tasks});

  factory TaskListModel.fromEntity(TaskListEntity entity) {
    return TaskListModel(name: entity.name, tasks: entity.tasks);
  }

  factory TaskListModel.fromJson(Map<String, dynamic> json) {
    return TaskListModel(
      name: json['name'] as String,
      tasks: (json['tasks'] as List<dynamic>)
          .map((e) => TaskItemModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'tasks': tasks.map((e) => (e as TaskItemModel).toJson()).toList(),
    };
  }
}
