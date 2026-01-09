import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/domain/entities/task_entity.dart';
import 'package:pomoflow/domain/repositories/task_repository.dart';

class GetTaskListUseCase implements UseCase<TaskListEntity?, NoParams> {
  final TaskRepository repository;

  GetTaskListUseCase(this.repository);

  @override
  Future<Either<Failure, TaskListEntity?>> call(NoParams params) async {
    return await repository.getTaskList();
  }
}
