import 'package:firebase_auth/firebase_auth.dart';
import '../sources/firebase_auth_source.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthRepository {
  final FirebaseAuthSource _source;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  AuthRepository(this._source);

  Stream<User?> get authState => _source.authStateChanges();

  Future<UserCredential> login(String email, String password) =>
      _source.signInWithEmail(email, password);

  Future<UserCredential> register(
    String firstName,
    String lastName,
    String email,
    String password,
  ) async {
    final cred = await _source.register(email, password);

    await _firestore.collection('users').doc(cred.user!.uid).set({
      'firstName': firstName,
      'lastName': lastName,
      'email': email,
      'createdAt': FieldValue.serverTimestamp(),
      'onboardingCompleted': false,
    });

    return cred;
  }

  Future<void> logout() => _source.signOut();

  Future<void> completeOnboarding(
    String uid,
    Map<String, dynamic> answers,
  ) async {
    await _firestore.collection('users').doc(uid).update({
      'onboardingCompleted': true,
      'answers': answers,
    });
  }
}
