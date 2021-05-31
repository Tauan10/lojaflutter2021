import 'package:flutter/material.dart';
import 'package:lojafinal/models/gerenciador_user.dart';
import 'package:provider/provider.dart';

class CustomDrawerHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(32, 24, 16, 6),
      height: 180,
      child: Consumer<UserManager>(
        builder: (_, userManager,__){
          return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
          // ignore: prefer_const_constructors
          Text(
            'TechTudoExpress',
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize:28,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Ola,${userManager.user?.name ?? ''}',
              overflow: TextOverflow.ellipsis,
              maxLines: 2,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.bold,
                
              ),
            ),
            GestureDetector(
              onTap:(){
                if(userManager.isLoggedIn){
                  // TODO: SAIR
                }else{
                  Navigator.of(context).pushNamed('/signup');
                  // Se eu nao tiver logado aqui vou para minha tela de login
                }
              },
              child: Text(
                userManager.isLoggedIn
                ? 'Sair'
                : 'Entre ou cadastra-se >',
                style: TextStyle(
                  color: Theme.of(context).primaryColor,
                  fontSize: 16,
                  fontWeight:FontWeight.bold,
                ),
              ),
            )
        ]
        );
        },
      )
    );
  }
}