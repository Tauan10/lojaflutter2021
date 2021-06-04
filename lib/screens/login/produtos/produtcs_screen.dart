import 'package:flutter/material.dart';
import 'package:lojafinal/common/custom_drawer/custom_drawer.dart';
import 'package:lojafinal/models/gerenciador_produto.dart';
import 'package:lojafinal/screens/login/produtos/componetes/search_dialog.dart';
import 'package:provider/provider.dart';

class ProductsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      appBar: AppBar(
        title: Consumer<ProductManager>(
          builder: (_, productManager,__){
            if(productManager.search.isEmpty){
              return const Text('Produtos');
            }else{
              return LayoutBuilder
              (builder: (_, constraints){
                return GestureDetector(
                onTap: ()async{
                  final search = await showDialog<String>(context: context, builder: (_) => SearchDialog(
                    productManager.search
                  ));
             if(search != null){
               productManager.search = search;
             }
                },
                child: Container(
                  width: constraints.biggest.width,
                  child: Text(productManager.search,
                  textAlign: TextAlign.center,
                  )),
              );
              }
              );
            }
          },
        ),
        centerTitle: true,
        actions: <Widget>[
          Consumer<ProductManager>(
            builder: (_, productManager,__){
              if(productManager.search.isEmpty){
                return IconButton(
            icon: Icon(Icons.search),
           onPressed: ()async{
             // ignore: prefer_const_constructors
             final search = await showDialog<String>(context: context, builder: (_) => SearchDialog(
               productManager.search
             ));

             if(search != null){
               productManager.search = search;
             }
           },

          );
              }else{
                 return IconButton(
            icon: Icon(Icons.close),
           onPressed: ()async{
             // ignore: prefer_const_constructors
             context.read<ProductManager>().search = '';

             
           },

          );
              }
            },
          )

        ],
      ),
      // ignore: missing_required_param
      body: Consumer<ProductManager>(
          builder: (_, productManager,__){
            final filteredProducts = productManager.filteredProducts;
            return ListView.builder(
              padding: const EdgeInsets.all(4),
              itemCount: filteredProducts.length,
          itemBuilder: (_, index){
            return ListTile(
              title: Text(productManager.filteredProducts[index].name),
            );
          }
          );
          },
      ),
    );
  }
}