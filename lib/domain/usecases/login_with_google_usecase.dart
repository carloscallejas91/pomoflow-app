import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/domain/entities/user_entity.dart';
import 'package:pomoflow/domain/repositories/auth_repository.dart';

class LoginWithGoogleUseCase implements UseCase<UserEntity, NoParams> {
  final AuthRepository repository;

  LoginWithGoogleUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(NoParams params) async {
    return await repository.loginWithGoogle();
  }
}

