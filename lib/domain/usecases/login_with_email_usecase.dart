import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/core/usecases/usecase.dart';
import 'package:pomoflow/domain/entities/user_entity.dart';
import 'package:pomoflow/domain/repositories/auth_repository.dart';

class LoginWithEmailParams extends Equatable {
  final String email;
  final String password;

  const LoginWithEmailParams({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class LoginWithEmailUseCase
    implements UseCase<UserEntity, LoginWithEmailParams> {
  final AuthRepository repository;

  LoginWithEmailUseCase(this.repository);

  @override
  Future<Either<Failure, UserEntity>> call(LoginWithEmailParams params) async {
    return await repository.loginWithEmail(params.email, params.password);
  }
}

