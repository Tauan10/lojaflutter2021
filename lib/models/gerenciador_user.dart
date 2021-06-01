import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:lojafinal/helpers/firebase_erros.dart';
import 'package:lojafinal/models/user.dart';


// SISTEMA DE CADASTRO E LOGIN FUNCIONANDO 
// USER MANAGER
// validaçao do firebase email e senha
class UserManager extends ChangeNotifier {
  // estou deixando privado porque nao vai chamar fora da classe UserMananger
  UserManager() {
    _loadCurrentUser();
  }
  final FirebaseAuth auth = FirebaseAuth.instance;
  final Firestore firestore = Firestore.instance;
  // Deixa facil 
 User user;

  bool _loading = false; // variavel privada "_"
  bool get loading => _loading; // espondo variavel atraves do get
  bool get isLoggedIn => user != null;

  Future<void> signIn({User user, Function onFail, Function onSuccess}) async {
    loading = true;

    // ignore: unused_local_variable
    try {
      // ignore: unused_local_variable
      final AuthResult result = await auth.signInWithEmailAndPassword(
          email: user.email, password: user.senha);
      
      await _loadCurrentUser(firebaseUser: result.user);
  
      onSuccess();
    } on PlatformException catch (e) {
      // ignore: avoid_print
      onFail(getErrorString(e.code));
    }

    loading = false; // quando setar aqui vai chamar o loading abaixo
  }

  //Função de login para sucesso ou fracasso

  Future<void> signUp({User user, Function onFail, Function onSuccess}) async {
    loading = true;
    try {
      final AuthResult result = await auth.createUserWithEmailAndPassword(
          email: user.email, password: user.senha);



      user.id =result.user.uid;
      this.user = user;

      await user.saveData();
      // Metodo de salvar os dados pessoais dos usuarios 
      onSuccess();
    } on PlatformException catch (e) {
      onFail(getErrorString(e.code));
    }
    // 27/05/2021
    loading = false;
  }
  void signOut(){
    auth.signOut();
    user = null;
    notifyListeners();
  }
  // TESTE DE PARA O GIT

// estou setando a variavel atraves de um set
  set loading(bool value) {
    _loading = value;
    notifyListeners();
  }

  Future<void> _loadCurrentUser({FirebaseUser firebaseUser}) async {
    final FirebaseUser currentUser = firebaseUser ?? await auth.currentUser();
    if (currentUser != null)  {
      final DocumentSnapshot docUser = await firestore.collection('users').document(currentUser.uid).get();

      user = User.fromDocument(docUser);
      notifyListeners();
    }

    
  }
}
