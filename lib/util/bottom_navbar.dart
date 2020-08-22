import 'package:flutter/material.dart';

import 'colors.dart';

TextStyle _bottomHeaderTextStyle() =>
    TextStyle(fontFamily: "Roboto", color: mainTextColor);

Widget bottomNavBar(
    int _selectedIndex, Function(int) onTap, BuildContext context) {
  return Container(
    decoration: BoxDecoration(boxShadow: [
      BoxShadow(color: icon1Color, offset: Offset(10, 10), spreadRadius: 10)
    ]),
    child: BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: SizedBox(
            height: 30,
            child: Image.asset("assets/icons/home.png", fit: BoxFit.fitWidth),
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
            child:
                Image.asset("assets/icons/profile.png", fit: BoxFit.fitWidth),
          ),
          title: Text('Профиль'),
        ),
      ],
      currentIndex: _selectedIndex,
      onTap: (index) => onTap(index),
    ),
  );
}
