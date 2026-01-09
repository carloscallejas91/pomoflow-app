import 'package:equatable/equatable.dart';

class TaskEntity extends Equatable {
  final String name;
  final bool isCompleted;

  const TaskEntity({required this.name, this.isCompleted = false});

  TaskEntity copyWith({String? name, bool? isCompleted}) {
    return TaskEntity(
      name: name ?? this.name,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  @override
  List<Object?> get props => [name, isCompleted];
}

class TaskListEntity extends Equatable {
  final String name;
  final List<TaskEntity> tasks;

  const TaskListEntity({required this.name, required this.tasks});

  @override
  List<Object?> get props => [name, tasks];
}
