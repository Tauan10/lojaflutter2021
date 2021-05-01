import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lojafinal/models/user.dart';

class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn(User user) async {
    // ignore: unused_local_variable
    try {
      // ignore: unused_local_variable
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.senha);
      print(result.user.uid);
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }
}
