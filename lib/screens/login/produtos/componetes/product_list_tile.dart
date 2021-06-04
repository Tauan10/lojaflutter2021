import 'package:flutter/material.dart';
import 'package:lojafinal/models/product.dart';

class ProductListTile extends StatelessWidget {

  // ignore: prefer_const_constructors_in_immutables
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
            const SizedBox( width: 16),
            Expanded(child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(product.name,
                // ignore: prefer_const_constructors
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w800
                ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 4),
                  child: Text(
                    'A partir de',
                    style: TextStyle(
                      color: Colors.grey[400],
                      fontSize: 12,
                    ),
                  ),
                  ),
                  Text(
                    'R\$ 19,99',
                    style: TextStyle(
                      fontSize:25,
                      fontWeight: FontWeight.w800,
                      color: Theme.of(context).primaryColor
                    )
                  )
              ],
              ))
          ],
        ),
      ),
    );
  }
}