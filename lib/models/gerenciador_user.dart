import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/services.dart';
import 'package:lojafinal/helpers/firebase_erros.dart';
import 'package:lojafinal/models/user.dart';

// USER MANAGER
// validaçao do firebase email e senha
class UserManager {
  final FirebaseAuth auth = FirebaseAuth.instance;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    // ignore: unused_local_variable
    try {
      // ignore: unused_local_variable
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.senha);
      onSuccess();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      onFail(getErrorString(e.code));
    }
  }
}
