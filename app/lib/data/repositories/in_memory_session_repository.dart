import 'session_repository.dart';

class InMemorySessionRepository implements SessionRepository {
  bool _signedIn = false;

  @override
  Future<bool> isSignedIn() async => _signedIn;

  @override
  Future<void> signIn() async {
    _signedIn = true;
  }

  @override
  Future<void> signOut() async {
    _signedIn = false;
  }
}
