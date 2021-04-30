import 'package:flutter/material.dart';
import 'package:lojafinal/models/page_manager.dart';
import 'package:provider/provider.dart';

class DrawerTile extends StatelessWidget {
  const DrawerTile({this.iconData, this.title, this.page});

  final IconData iconData;
  final String title;
  final int page;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context.read()<PageManeger>().setPage(page);
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
