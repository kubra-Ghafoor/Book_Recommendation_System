import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService {
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;

  Future<User?> checkAuthenticationStatus() async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;

    if (user != null) {
      // User is signed in
      print('User is signed in: ${user.email}');
      return user;
    } else {
      // User is not signed in
      print('User is not signed in');
      return null;
    }
  }

  Future<User?> signUp(
      String name, String email, String password, BuildContext context) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      userCredential.user?.updateDisplayName(name);
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('e $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
    return null;
  }

  Future<User?> signIn(
      BuildContext context, String email, String password) async {
    try {
      final UserCredential userCredential =
          await firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(e.code)));
    }
    return null;
  }

  signOut() async {
    await firebaseAuth.signOut();
  }
}
