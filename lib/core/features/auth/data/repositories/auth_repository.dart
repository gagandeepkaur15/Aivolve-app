import 'package:firebase_auth/firebase_auth.dart';
import '../sources/firebase_auth_source.dart';

class AuthRepository {
  final FirebaseAuthSource _source;

  AuthRepository(this._source);

  Stream<User?> get authState => _source.authStateChanges();

  Future<UserCredential> login(String email, String password) =>
      _source.signInWithEmail(email, password);

  Future<UserCredential> register(String email, String password) =>
      _source.register(email, password);

  Future<void> logout() => _source.signOut();
}
