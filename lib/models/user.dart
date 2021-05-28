import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  User({this.email, this.senha, this.name, this.id});

  User.fromDocument(DocumentSnapshot document){
    id = document.documentID;
    name = document.data['name']as String ;
    email = document.data['email']as String ;
  }
  String id;
  String name;
  String email;
  String senha;

  String confirmacaoSenha;

  DocumentReference get firestoreRef => 
  Firestore.instance.document('user/$id');


  Future<void> saveData()async{
  await firestoreRef.setData(toMap());
  }

// Aqui transforma os dados aqui do usuario em mapa
    Map<String, dynamic> toMap(){
      return{
        'name': name,
        'email':email,
      };
    }
  }

