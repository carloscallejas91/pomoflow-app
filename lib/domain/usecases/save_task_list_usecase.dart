import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/domain/entities/task_entity.dart';
import 'package:pomoflow/domain/repositories/task_repository.dart';

class SaveTaskListUseCase implements UseCase<void, TaskListEntity> {
  final TaskRepository repository;

  SaveTaskListUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(TaskListEntity params) async {
    return await repository.saveTaskList(params);
  }
}

