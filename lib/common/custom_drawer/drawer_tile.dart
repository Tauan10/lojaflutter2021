import 'package:flutter/material.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({this.iconData, this.title, this.pagina});

  final IconData iconData;
  final String title;
  final int pagina;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        debugPrint('TOquei $pagina');
      },
      child: SizedBox(
        height: 60,
        child: Row(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 9),
              child: Icon(
                iconData,
                size: 32,
                color: Colors.blue[700],
              ),
            ),
            Text(
              title,
              // ignore: prefer_const_constructors
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            )
          ],
        ),
      ),
    );
  }
}
