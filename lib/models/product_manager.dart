
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:lojafinal/models/product.dart';

class ProductManager extends ChangeNotifier{
  ProductManager(){
    _loadAllProducts();
  }


  final Firestore firestore = Firestore.instance;

  List<Product> allProducts =[];

  Future<void> _loadAllProducts()async {
    final QuerySnapshot snapProduts =
    await firestore.collection('products').getDocuments();


    
    allProducts = snapProduts.documents.map((d) => 
     Product.fromDocument(d)).toList();
     

     notifyListeners();

 
    
  }
}