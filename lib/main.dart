import 'package:flutter/material.dart';
import 'package:lojafinal/screens/base/base_screens.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loja de Informatica',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          fontFamily: 'Comfortaa',
          primaryColor: const Color.fromARGB(255, 235, 155, 0),
          scaffoldBackgroundColor: const Color.fromARGB(220, 235, 120, 0),
          visualDensity: VisualDensity.adaptivePlatformDensity,
          appBarTheme: const AppBarTheme(elevation: 0)),
      home: BaseScreen(),
    );
  }
}
