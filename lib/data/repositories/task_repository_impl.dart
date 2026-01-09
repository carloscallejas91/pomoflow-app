import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/domain/entities/task_entity.dart';
import 'package:pomoflow/domain/repositories/task_repository.dart';

class TaskRepositoryImpl implements TaskRepository {
  TaskListEntity? _currentTaskList;

  @override
  Future<Either<Failure, void>> saveTaskList(TaskListEntity taskList) async {
    try {
      _currentTaskList = taskList;

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, TaskListEntity?>> getTaskList() async {
    try {
      return Right(_currentTaskList);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteTaskList() async {
    try {
      _currentTaskList = null;

      return const Right(null);
    } catch (e) {
      return Left(CacheFailure(e.toString()));
    }
  }
}
