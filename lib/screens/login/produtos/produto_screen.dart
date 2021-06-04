import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:lojafinal/models/produtos.dart';


class ProductScreen extends StatelessWidget {

  const ProductScreen(this.product);

  final Product product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(product.name),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Carousel(
            images: product.images.map((url) {
              return NetworkImage(url);
            } ).toList(),
          )
        ],
      ),
    );
  }
}