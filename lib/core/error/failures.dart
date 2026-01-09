import 'package:equatable/equatable.dart';

/// Classe base para todas as falhas do sistema.
/// Diferente de Exceptions, Failures são objetos retornados (não lançados) pelos UseCases e Repositories,
/// permitindo um fluxo de controle mais previsível e funcional.
abstract class Failure extends Equatable {
  final String message;
  const Failure(this.message);

  @override
  List<Object> get props => [message];
}

/// Representa uma falha vinda do servidor (API).
/// Geralmente mapeada a partir de uma [ServerException].
class ServerFailure extends Failure {
  const ServerFailure(super.message);
}

/// Representa uma falha de cache ou armazenamento local.
/// Geralmente mapeada a partir de uma [CacheException].
class CacheFailure extends Failure {
  const CacheFailure(super.message);
}

/// Representa uma falha nas operações de autenticação.
/// Mapeada a partir de uma [AuthException], indicando problemas como credenciais inválidas.
class AuthFailure extends Failure {
  const AuthFailure(super.message);
}
