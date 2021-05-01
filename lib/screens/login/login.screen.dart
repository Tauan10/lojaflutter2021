import 'package:flutter/material.dart';
import 'package:lojafinal/helpers/validacao.dart';
import 'package:lojafinal/models/gerenciador_user.dart';
import 'package:lojafinal/models/user.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldMessengerKey =
      GlobalKey<ScaffoldState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldMessengerKey,
      appBar: AppBar(
        title: const Text('Entrar'),
        centerTitle: true,
      ),
      body: Center(
        child: Card(
          color: Colors.white,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
          margin: const EdgeInsets.symmetric(horizontal: 16),
          child: Form(
            key: formkey,
            child: ListView(
              padding: const EdgeInsets.all(16),
              shrinkWrap: true,
              children: [
                TextFormField(
                  controller: emailController,
                  decoration: const InputDecoration(hintText: 'E-mail'),
                  keyboardType: TextInputType.emailAddress,
                  autocorrect: false,
                  // ignore: missing_return
                  validator: (email) {
                    if (!emailValido(email)) return 'Email inválido';
                    return null;
                  },
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: senhaController,
                  decoration: const InputDecoration(hintText: 'Senha'),
                  autocorrect: false,
                  obscureText: true,
                  validator: (senha) {
                    if (senha.isEmpty || senha.length < 6)
                      // ignore: curly_braces_in_flow_control_structures
                      return 'Senha inválida';
                    return null;
                  },
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Esqueci minha Senha',
                        style: TextStyle(color: Colors.black),
                      )),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  height: 44,
                  child: ElevatedButton(
                      // TODO: https://stackoverflow.com/questions/64995163/how-to-i-change-the-disabled-color-of-an-elevatedbutton
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          context.read<UserManager>().signIn(
                              user: User(
                                  email: emailController.text,
                                  senha: senhaController.text),
                              //callback
                              onFail: (e) {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(SnackBar(
                                  content: Text('Falha ao entrar:$e'),
                                ));
                              },
                              onSuccess: () {
                                // TODO: FECHAR TELA DE LOGN
                              });
                        }
                      },
                      // ignore: prefer_const_constructors
                      style: ElevatedButton.styleFrom(
                          primary: const Color.fromARGB(255, 235, 155, 0)),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(color: Colors.white, fontSize: 18),
                      )),
                )
              ],
              // primary: Color.fromARGB(255, 235, 155, 0*/
            ),
          ),
        ),
      ),
    );
  }
}
