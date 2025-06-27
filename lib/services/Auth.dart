import 'package:firebase_auth/firebase_auth.dart';

abstract class AuthBase {
  Future<User?> Login_with_email_and_password(String email, String password);
  Future<User?> Signup_with_email_and_password(String email, String password);

  User? get currentUser;
  Stream<User?> get authStateChanges;
  Future<void> logoutOut();
}

class auth implements AuthBase {
  @override
  Future<void> logoutOut() async {
    // TODO: implement logoutOut
    await _firebase_auth.signOut();
  }

  final _firebase_auth = FirebaseAuth.instance;
  @override
  Future<User?> Login_with_email_and_password(
    String email,
    String password,
  ) async {
    final user = await _firebase_auth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
    return user.user;
  }

  @override
  Future<User?> Signup_with_email_and_password(
    String email,
    String password,
  ) async {
    final userCredential = await _firebase_auth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
    return userCredential.user;
  }

  @override
  Stream<User?> get authStateChanges => _firebase_auth.authStateChanges();
  @override
  User? get currentUser => _firebase_auth.currentUser;
}
