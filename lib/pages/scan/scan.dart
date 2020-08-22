import 'package:flutter/cupertino.dart';
import 'package:qr_mobile_vision/qr_camera.dart';
import 'package:flutter/material.dart';
import 'package:tolego/util/colors.dart';
import 'package:tolego/data/product.dart';

class ScanTab extends StatefulWidget {
  @override
  _ScanTabState createState() => _ScanTabState();
}

class _ScanTabState extends State<ScanTab> {
  List<Product> _productsList = [
    Product(
        price: 220,
        title: "Coca-cola 0.5 л напиток",
        image: Image.asset("assets/mock_data/product1.png")),
    Product(
        price: 265,
        title: "Активиа йогурт",
        image: Image.asset("assets/mock_data/product2.png"),
        quantity: 2),
    Product(
      price: 570,
      title: "Банан",
      image: Image.asset("assets/mock_data/product3.png"),
      quantity: 0.857,
    ),
    Product(
        price: 580,
        title: "Цесна рис 800 гр",
        image: Image.asset("assets/mock_data/product4.png")),
    Product(
        price: 685,
        title: "\"President\" сыр плавленый 200 гр",
        image: Image.asset("assets/mock_data/product5.png")),
  ];

  double _calculateTotalPrice() => _productsList.fold(
      0.0, (sum, product) => sum += product.price * product.quantity);

  String _removeTrailingZeros(double num) =>
      num.toString().replaceAll(RegExp(r"([.]*0)(?!.*\d)"), "");

  TextStyle _priceTextStyle() => TextStyle(
        fontSize: 12,
        fontFamily: "Roboto",
        color: mainTextColor,
        fontWeight: FontWeight.bold,
      );

  Widget _createProductTile(Product product) => Row(
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: product.image,
            ),
          ),
          Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                product.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontSize: 12, fontFamily: "Roboto", color: mainTextColor),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    IconButton(
                      icon: Icon(Icons.add),
                      color: icon1Color,
                      onPressed: () {},
                    ),
                    IconButton(
                      icon: Icon(
                        IconData(0xf2f4,
                            fontFamily: CupertinoIcons.iconFont,
                            fontPackage: CupertinoIcons.iconFontPackage),
                        color: Color.fromRGBO(0xC9, 0x22, 0x2C, 100),
//                      size: 70,
                      ),
                      onPressed: () {},
                    ),
                  ],
                ),
                Text(
                  (product.quantity != 1
                          ? "${_removeTrailingZeros(product.quantity)} x ${_removeTrailingZeros(product.price)}"
                          : "") +
                      " = ${_removeTrailingZeros(product.price * product.quantity)} тг",
                  style: _priceTextStyle(),
                ),
              ],
            ),
          ),
        ],
      );

  Widget _footer(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      child: Container(
        //Generate footer if product list is not empty
        child: Column(
          children: _productsList.length == 1
              ? [Container()]
              : [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Товаров: ${_productsList.length}",
                        style: _priceTextStyle(),
                      ),
                      Text(
                        "Итого: ${_calculateTotalPrice()} тг",
                        style: _priceTextStyle(),
                      ),
                    ],
                  ),
                  FlatButton(
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 50),
                      child: Text(
                        "Далее",
                        style: TextStyle(fontSize: 14, color: Colors.white),
                      ),
                    ),
                    color: icon1Color,
                    onPressed: () {},
                  )
                ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext buildContext) {
    return SafeArea(
      child: Scaffold(
          body: Column(
            children: [
              new Flexible(
                flex: 37,
                child: QrCamera(
                  qrCodeCallback: (code) {
                    print(code);
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Список покупок",
                    textAlign: TextAlign.start,
                    style: TextStyle(
                      fontFamily: "Roboto",
                      color: mainTextColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Divider(),
              new Flexible(
                flex: 63,
                child: ListView.separated(
                  itemCount: _productsList.length + 1,
                  separatorBuilder: (context, index) => Divider(
                    color: subTextColor,
                  ),
                  itemBuilder: (context, index) {
                    if (index == _productsList.length) {
                      return _footer(context);
                    } else {
                      return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 15),
                          child: _createProductTile(_productsList[index]));
                    }
                  },
                ),
              ),
            ],
          ),
        ),
    );
  }
}
