import 'package:firebase_auth/firebase_auth.dart';
import 'package:mobx/mobx.dart';
import 'package:searchack/services/firebase_auth_service.dart';
part 'auth_store.g.dart';

final IFirebaseAuthService _firebaseAuthService =
    FirebaseAuthServiceImpl(FirebaseAuth.instance);

class AuthStore = AuthStoreBase with _$AuthStore;

abstract class AuthStoreBase with Store {
  @action
  Future<bool> signIn(String email, String password) async {
    try {
      _firebaseAuthService.signIn(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }

  @action
  Future<bool> signUp(String email, String password) async {
    try {
      _firebaseAuthService.signUp(email, password);
      return true;
    } on FirebaseAuthException catch (e) {
      throw Exception(e);
    }
  }
}
