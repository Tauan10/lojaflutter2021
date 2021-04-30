import 'package:flutter/material.dart';
import 'package:lojafinal/common/custom_drawer/custom_drawer.dart';
import 'package:lojafinal/models/page_manager.dart';
import 'package:provider/provider.dart';

class BaseScreen extends StatelessWidget {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => PageManeger(pageController),
      child: PageView(
        controller: pageController,
        children: <Widget>[
          Scaffold(
            drawer: CustomDrawer(),
            appBar: AppBar(
              title: const Text('Home'),
            ),
          ),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.black,
          ),
          Container(
            color: Colors.blue,
          )
        ],
      ),
    );
  }
}
