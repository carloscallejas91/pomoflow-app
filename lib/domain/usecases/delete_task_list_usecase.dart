import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/domain/repositories/task_repository.dart';

class DeleteTaskListUseCase implements UseCase<void, NoParams> {
  final TaskRepository repository;

  DeleteTaskListUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(NoParams params) async {
    return await repository.deleteTaskList();
  }
}

