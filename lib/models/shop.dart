import 'package:ecommerceapp/models/product.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  // products for sale
  final List<Product> _shop = [
    Product(name: "T-shirt", price: 200, description: "description", imagePath:'assets/shirt.jpg' ),
    Product(name: "Pants", price: 189, description: "description",  imagePath:'assets/pants.jpg'),
    Product(name: "Journal Diary", price: 25, description: "description",  imagePath:'assets/Diary.jpg'),
    Product(name: "Plate", price: 55, description: "description",  imagePath:'assets/plate.jpeg'),
  ];

  //user cart
  List<Product> _cart = [];

  //get product list
  List<Product> get shop => _shop;

  //get user cart
  List<Product> get cart => _cart;


  //add item to cart
  void addToCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  //remove item from cart
  void removeFromCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }
}
