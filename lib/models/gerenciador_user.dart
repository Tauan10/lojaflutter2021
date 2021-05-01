import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lojafinal/helpers/firebase_erros.dart';
import 'package:lojafinal/models/user.dart';

// USER MANAGER
// validaçao do firebase email e senha
class UserManager extends ChangeNotifier {
  final FirebaseAuth auth = FirebaseAuth.instance;

  bool loading = false;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    setLoading(true);

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

    setLoading(false);
  }

  void setLoading(bool value) {
    loading = value;
  }
}
