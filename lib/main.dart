import 'package:flutter/material.dart';
import 'package:lojafinal/models/gerenciador_user.dart';
import 'package:lojafinal/screens/base/base_screens.dart';
import 'package:lojafinal/screens/login/cadastro/cadastro_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => UserManager(),
      child: MaterialApp(
        title: 'Loja de Informatica',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Comfortaa',
            primaryColor: const Color.fromARGB(255, 235, 155, 0),
            scaffoldBackgroundColor: const Color.fromARGB(2255, 235, 155, 0),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0)),
        home: CadastroScreen(),
      ),
    );
  }
}
