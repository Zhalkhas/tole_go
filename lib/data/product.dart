import 'package:flutter/material.dart';

class Product {
  String title;
  double price;
  Widget image;
  double quantity;

  Product({this.title, this.price, this.image, this.quantity = 1}) {
//    this.image = Icon(Icons.shopping_cart);
  }
}
