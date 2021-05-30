import 'package:flutter/material.dart';
import 'package:lojafinal/helpers/validacao.dart';
import 'package:lojafinal/models/gerenciador_user.dart';
import 'package:lojafinal/models/user.dart';
import 'package:provider/provider.dart';

class CadastroScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldMessengerState> scaffoldMessengerKey =
      GlobalKey<ScaffoldMessengerState>();

  final User user = User();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Criar conta'),
      ),
      body: Center(
        child: Card(
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: <Widget>[
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Nome Completo'),
                  // ignore: missing_return
                  validator: (name) {
                    if (name.isEmpty)
                      // ignore: curly_braces_in_flow_control_structures
                      return 'Campo obrigatório';
                    else if (name.trim().split(' ').length <= 1)
                      // ignore: curly_braces_in_flow_control_structures
                      return 'Preencha seu nome completo';
                    return null;
                  },
                  onSaved: (name) => user.name,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  // ignore: missing_return
                  validator: (email) {
                    if (email.isEmpty)
                      // ignore: curly_braces_in_flow_control_structures
                      return 'Campo obrigatório';
                    else if (!emailValido(email)) return 'E-mail invalido';
                    return null;
                  },
                  onSaved: (email) => user.email = email,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Senha'),
                  onSaved: (pass) => user.senha = pass,
                  // ignore: missing_return
                  validator: (pass) {
                    if (pass.isEmpty)
                      // ignore: curly_braces_in_flow_control_structures
                      return 'Campo obrigatório';
                    else if (pass.length < 6) return 'Senha muito curta';
                    return null;
                  },

                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  decoration: const InputDecoration(hintText: 'Repita a senha'),
                  validator: (pass) {
                    if (pass.isEmpty)
                      // ignore: curly_braces_in_flow_control_structures
                      return 'Campo obrigatório';
                    else if (pass.length < 6) return 'Senha muito curta';
                    return null;
                  },
                  onSaved: (pass) => user.confirmacaoSenha = pass,
                  obscureText: true,
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                    height:
                        44, //-------------BUTOON --EXEMPLO-------------------
                    child: ElevatedButton(
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          formkey.currentState.save();
                          if (user.senha != user.confirmacaoSenha) {
                            ScaffoldMessenger.of(context)
                                // ignore: prefer_const_constructors
                                .showSnackBar(SnackBar(
                              // ignore: prefer_const_constructors
                              content: const Text('Senhas não coincidem'),
                              backgroundColor: Colors.red,
                              //Mensagem
                            ));
                            return;
                          }

                          context.read<UserManager>().signUp(
                              user: user,
                              onSuccess: () {
                                Navigator.of(context).pop();
                              },
                              onFail: (e) {
                                scaffoldMessengerKey.currentState
                                    .showSnackBar(SnackBar(
                                  content: Text('Falha ao cadastrar: $e'),
                                  backgroundColor: Colors.red,
                                ));
                              });
                        }
                      },
                      // ignore: sort_child_properties_last
                      child: const Text(
                        'Criar conta',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: const Color.fromARGB(255, 235, 155, 0),
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
