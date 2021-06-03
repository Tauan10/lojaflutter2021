import 'package:flutter/material.dart';
import 'package:lojafinal/common/custom_drawer/custon_drawer_header.dart';
import 'package:lojafinal/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Stack(
        children: <Widget>[
          Container(
            // ignore: prefer_const_constructors
            decoration: BoxDecoration(
              // ignore: prefer_const_constructors
              gradient: LinearGradient(
              // ignore: prefer_const_literals_to_create_immutables
              colors: [const Color.fromARGB(255, 255, 155, 0), Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
          ),
          ListView(
            children: <Widget>[
              CustomDrawerHeader(),
              const Divider(),
              const DrawerTile(
                iconData: Icons.home,
                title: 'Inicio',
                page: 0,
              ),
              const DrawerTile(
                iconData: Icons.list,
                title: 'Produtos',
                page: 1,
              ),
              const DrawerTile(
                iconData: Icons.playlist_add_check,
                title: 'Meus Pedidos',
                page: 2,
              ),
              const DrawerTile(
                iconData: Icons.add_location,
                title: 'Endereços das lojas',
                page: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
