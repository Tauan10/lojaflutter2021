import 'package:flutter/material.dart';
import 'package:lojafinal/common/custom_drawer/custom_drawer.dart';
import 'package:lojafinal/models/product_manager.dart';
import 'package:lojafinal/screens/login/produtos/componetes/search_dialog.dart';
import 'package:provider/provider.dart';


class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: const Text('Produtos'),
        centerTitle: true,
        actions: <Widget>[
         IconButton(
           onPressed: (){
             showDialog(context: context,
              builder: (_) => SearchDialog());
           }, 
            icon: Icon(Icons.search),)
        ],
      ),
      body: Consumer<ProductManager>(
          builder: (_,productManager,__){
          return  ListView.builder(
            padding: const EdgeInsets.all(4),
          itemCount: productManager.allProducts.length,
          itemBuilder: (_,index){
            return ListTile( title: Text(productManager.allProducts[index].name),
            );
          },
        );
              },
      ),
    );
  }
}