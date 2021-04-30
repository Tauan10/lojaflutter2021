import 'package:flutter/material.dart';
import 'package:lojafinal/helpers/validacao.dart';

class LoginScreen extends StatelessWidget {
  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      onPressed: () {
                        if (formkey.currentState.validate()) {
                          emailController.text;
                          senhaController.text;
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
