/// Exceção lançada quando ocorre uma falha na comunicação com o servidor.
/// Geralmente utilizada em Repositories e DataSources remotos.
class ServerException implements Exception {
  final String message;
  ServerException(this.message);
}

/// Exceção lançada quando ocorre uma falha no armazenamento ou recuperação local de dados.
/// Geralmente utilizada em DataSources locais (Cache, SharedPreferences, SQLite).
class CacheException implements Exception {
  final String message;
  CacheException(this.message);
}

/// Exceção específica para falhas relacionadas a autenticação.
/// Pode ser usada para erros de login, cadastro ou validação de sessão.
class AuthException implements Exception {
  final String message;
  AuthException(this.message);
}
