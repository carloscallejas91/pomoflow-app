import 'package:dartz/dartz.dart';
import 'package:pomoflow/core/error/failures.dart';
import 'package:pomoflow/domain/entities/user_entity.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserEntity>> loginWithGoogle();
  Future<Either<Failure, UserEntity>> loginWithEmail(
    String email,
    String password,
  );
  Future<Either<Failure, UserEntity>> registerWithEmail(
    String email,
    String password,
    String name,
  );
  Future<Either<Failure, UserEntity>> getCurrentUser();
  Future<Either<Failure, void>> sendPasswordResetEmail(String email);
  Future<Either<Failure, void>> logout();
}

