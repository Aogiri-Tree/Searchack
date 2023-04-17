import 'package:firebase_auth/firebase_auth.dart';

abstract class IFirebaseAuthService {
  Stream<User?> get authStateChanges;
  Future<void> signIn(String email, String password);
  Future<void> signUp(String email, String password);
}

class FirebaseAuthServiceImpl implements IFirebaseAuthService {
  final FirebaseAuth _firebaseAuth;

  FirebaseAuthServiceImpl(this._firebaseAuth);
  @override
  Future<void> signIn(String email, String password) async {
    await _firebaseAuth.signInWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Future<void> signUp(String email, String password) async {
    await _firebaseAuth.createUserWithEmailAndPassword(
      email: email,
      password: password,
    );
  }

  @override
  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();
}
