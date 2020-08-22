import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tolego/data/product.dart';

class ProductList extends StatefulWidget {
  List<Product> products;

  ProductList({this.products});

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    throw UnimplementedError();
  }
}

class _ProductListState extends State<ProductList> {
  List<Product> products;

  _ProductListState({this.products});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: CupertinoPageScaffold(
        child: Text("Products list"),
      ),
    );
  }
}
