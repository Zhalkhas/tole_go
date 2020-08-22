import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FaqWidget extends StatelessWidget {
  final answers = [
    "“ToleGo” - это мобильное приложение, позволяющее совершать покупки, сканируя желаемые товары и оплачивая картой.",
    "",
    "",
    "",
    "",
    ""
  ];

  final questions = [
    "Что такое \"ToleGo\"?",
    "Как зарегистрироваться?",
    "Как оплачивать приложением?",
    "Как привязать банковскую карту?",
    "Что делать, если товар не сканируется?",
    "Что делать, если не проходит транзакция?",
  ];

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          title: Text(
            "Часто задаваемые вопросы",
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Roboto",
                fontWeight: FontWeight.bold),
          ),
          leading: IconButton(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
            icon: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        body: ListView.separated(
          separatorBuilder: (context, index) => Divider(),
          itemCount: questions.length + 1,
          itemBuilder: (context, index) {
            if (index == questions.length) {
              return Container();
            }
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 10),
              child: ExpansionTile(
                title: Text(questions[index]),
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 25),
                    child: Text(
                      answers[index],
                      style: TextStyle(
                        fontFamily: "Roboto",
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      );
}
