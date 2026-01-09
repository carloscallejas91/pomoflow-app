import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/domain/repositories/auth_repository.dart';

class SendPasswordResetEmailUseCase implements UseCase<void, String> {
  final AuthRepository repository;

  SendPasswordResetEmailUseCase(this.repository);

  @override
  Future<Either<Failure, void>> call(String email) async {
    return await repository.sendPasswordResetEmail(email);
  }
}

