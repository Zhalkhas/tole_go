import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tolego/pages/home/home.dart';
import 'package:tolego/pages/profile/profile.dart';
import 'package:tolego/util/colors.dart';
import 'package:tolego/pages/scan/scan.dart';
import 'package:flutter_statusbarcolor/flutter_statusbarcolor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    FlutterStatusbarcolor.setStatusBarColor(icon1Color);
    return MaterialApp(
      title: 'ToleGO',
      theme: ThemeData(
        fontFamily: "Roboto",
        backgroundColor: Colors.white,
        accentColor: getColor(0x85, 0xA7, 0x3F),
        errorColor: getColor(0xC9, 0x22, 0x2C),
      ),
      home: CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          backgroundColor: Colors.white,
          items: [
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 30,
                child:
                    Image.asset("assets/icons/home.png", fit: BoxFit.fitWidth),
              ),
              title: Text(
                'Главная',
                style: _bottomHeaderTextStyle(),
              ),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 80,
                child: Image.asset(
                  "assets/icons/fullscan.png",
                  fit: BoxFit.fitWidth,
                ),
              ),
              title: Text(
                '',
                style: TextStyle(height: 0.0),
              ),
            ),
            BottomNavigationBarItem(
              icon: SizedBox(
                height: 30,
                child: Image.asset("assets/icons/profile.png",
                    fit: BoxFit.fitWidth),
              ),
              title: Text(
                'Профиль',
                style: _bottomHeaderTextStyle(),
              ),
            ),
          ],
        ),
        tabBuilder: (context, index) {
          switch (index) {
            case 0:
              return CupertinoTabView(
                builder: (context) => HomeTab(),
              );
              break;
            case 1:
              return CupertinoTabView(
                builder: (context) => ScanTab(),
              );
              break;
            case 2:
              return CupertinoTabView(
                builder: (context) => ProfileTab(),
              );
              break;
          }
          return CupertinoTabView();
        },
      ),
    );
  }

  TextStyle _bottomHeaderTextStyle() =>
      TextStyle(fontFamily: "Roboto", color: mainTextColor);
}
