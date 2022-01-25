import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  static Future<UserCredential> register(String email, String password) async {
    return FirebaseAuth
      .instance
      .createUserWithEmailAndPassword(
        email: email,
        password: password 
      );
  }

  static Future<UserCredential> login(String email, String password) async {
    return FirebaseAuth
      .instance
      .signInWithEmailAndPassword(
        email: email,
        password: password 
      );
  }

  static Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }
}