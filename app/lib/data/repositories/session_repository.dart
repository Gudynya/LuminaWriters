/// Estado de sesión de la aplicación (MVP: simulación en memoria).
abstract class SessionRepository {
  Future<bool> isSignedIn();

  Future<void> signIn();

  Future<void> signOut();
}
