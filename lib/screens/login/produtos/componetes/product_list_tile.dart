import 'package:flutter/material.dart';
import 'package:lojafinal/models/product.dart';

class ProductListTile extends StatelessWidget {

  ProductListTile(this.product);
  final Product product;
  @override
  Widget build(BuildContext context) {
    return Card(
      // ignore: prefer_const_constructors
      shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(5)
      ) ,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(8),
        child: Row(
          children: <Widget>[
            AspectRatio(aspectRatio: 1,
            child: Image.network(product.images.first),
            ),
            Expanded(child: Column(
              children: <Widget>[
                Text(product.name,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800
                ),
                )
              ],
              ))
          ],
        ),
      ),
    );
  }
}