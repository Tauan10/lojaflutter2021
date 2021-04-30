import 'package:flutter/material.dart';
import 'package:lojafinal/common/custom_drawer/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // ignore: prefer_const_literals_to_create_immutables
        children: <Widget>[
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
            title: 'Lojas',
            page: 3,
          ),
        ],
      ),
    );
  }
}
