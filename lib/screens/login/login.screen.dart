import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
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
          child: ListView(
            padding: const EdgeInsets.all(16),
            shrinkWrap: true,
            children: [
              TextFormField(
                decoration: const InputDecoration(hintText: 'E-mail'),
                keyboardType: TextInputType.emailAddress,
                autocorrect: false,
                validator: (email) {
                  return null;
                },
              ),
              const SizedBox(
                height: 16,
              ),
              TextFormField(
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
                    onPressed: () {},
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
    );
  }
}
