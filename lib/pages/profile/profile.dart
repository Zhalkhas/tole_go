import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tolego/pages/profile/faq.dart';

class ProfileTab extends StatelessWidget {
  Widget _tilesPadding(Widget child) =>
      Padding(
        child: child,
        padding: EdgeInsets.symmetric(horizontal: 15),
      );

  Widget _menuEntry(title, onclick) =>
      _tilesPadding(
        ListTile(
          title: Text(
            title,
            style: TextStyle(fontFamily: "Roboto"),
          ),
          trailing: Icon(
            Icons.arrow_forward_ios,
            color: Color.fromRGBO(0x3B, 0x3D, 0x38, 100),
          ),
          onTap: onclick,
        ),
      );

  Widget _thickDivider() =>
      Divider(
        color: Color.fromARGB(0xff, 0x85, 0xA7, 0x3F),
        thickness: 16,
      );

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          children: [
            _tilesPadding(
              ListTile(
                title: Text(
                  "Мой профиль",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            _tilesPadding(ListTile(
              leading:
              Image.asset("assets/icons/user.png", fit: BoxFit.fitWidth),
              title: Text("Жандос Омаров"),
              subtitle: Text("+7 701 123 34 56"),
              trailing: Icon(
                Icons.arrow_forward_ios,
                color: Color.fromRGBO(0x3B, 0x3D, 0x38, 100),
              ),
            )),
            Divider(),
            _menuEntry("Мои карты", () {}),
            Divider(),
            _menuEntry("История покупок", () {}),
            _thickDivider(),
            _menuEntry("Часто задаваемые вопросы", () =>
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => FaqWidget()))),
            Divider(),
            _menuEntry("Связаться с нами", () {}),
            _thickDivider(),
            _menuEntry("Политика кофидециальности", () {}),
            Divider(),
            _menuEntry("Условия и положения", () {}),
            _thickDivider(),
            _tilesPadding(ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 0,horizontal: 17),
              title: Text(
                "Выйти",
                style: TextStyle(
                    color: Color.fromARGB(0xff, 0xC9, 0x22, 0x2C),
                    fontFamily: "Roboto"),
              ),
            )),
            Divider(),
          ],
        ),
      ),
    );
  }
}
