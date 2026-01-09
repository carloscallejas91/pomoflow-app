import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/domain/entities/task_entity.dart';

abstract class TaskRepository {
  Future<Either<Failure, void>> saveTaskList(TaskListEntity taskList);
  Future<Either<Failure, TaskListEntity?>> getTaskList();
  Future<Either<Failure, void>> deleteTaskList();
}

