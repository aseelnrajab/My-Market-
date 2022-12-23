import 'package:firebase_auth/firebase_auth.dart';

import 'Routers/app_router.dart';

class AuthHelper {
  AuthHelper._();

  static AuthHelper authHelper = AuthHelper._();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<String?> createAccount(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      // signOut();
      return userCredential.user?.uid;
    } on Exception catch (e) {
      AppRouter.appRouter
          .showCustomDialog('Error in Registration', e.toString());
    }
  }

  Future<String?> signIn(String email, String password) async {
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      return userCredential.user?.uid;
    } on Exception catch (e) {
      AppRouter.appRouter.showCustomDialog('Login is rejected', e.toString());
    }
  }

  Future<bool> forgetPassword(String email) async {
    try {
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return true;
    } on Exception catch (e) {
      AppRouter.appRouter.showCustomDialog('Reset is rejected', e.toString());
    }
    return false;
  }

  Future<void> signOut() async {
    await _firebaseAuth.signOut();
  }

  String? checkUser() {
    User? user = _firebaseAuth.currentUser;

    return user?.uid;
  }

  // String? updateUser() {
  //   User? currentUser = _firebaseAuth.currentUser;
  //   currentUser?.updateDisplayName();
  // }
}
