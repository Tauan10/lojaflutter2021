import 'package:flutter/material.dart';
import 'package:lojafinal/models/gerenciador_user.dart';
import 'package:lojafinal/screens/base/base_screens.dart';
import 'package:lojafinal/screens/login/cadastro/cadastro_screen.dart';
import 'package:lojafinal/screens/login/login.screen.dart';
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
      lazy: false,
      child: MaterialApp(
        title: 'Loja de Informatica 01',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Comfortaa',
            primaryColor: const Color.fromARGB(255, 235, 155, 0),
            scaffoldBackgroundColor: const Color.fromARGB(2255, 235, 155, 0),
            visualDensity: VisualDensity.adaptivePlatformDensity,
            appBarTheme: const AppBarTheme(elevation: 0)),
        initialRoute: '/base',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(builder: (_) => LoginScreen());
            case '/signup':
              return MaterialPageRoute(builder: (_) => CadastroScreen());
            case '/base':
            default:
              return MaterialPageRoute(builder: (_) => BaseScreen());
          }
        },
      ),
    );
  }
}
