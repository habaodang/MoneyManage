import 'package:flutter/material.dart';
import 'package:myapp/item/ItemSpendingContent.dart';
import 'package:myapp/item/ItemYourFinance.dart';
import 'package:myapp/widget/card_finance.dart';
import 'package:myapp/widget/card_spending_content.dart';
import 'package:myapp/widget/input_content.dart';

import '../widget/card_balance.dart';

class MoneyManage extends StatelessWidget {
  const MoneyManage({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme: const TextTheme(
              bodyLarge: TextStyle(
                fontSize: 20, // Set the desired font size
                color: Colors.white,
              ),
              bodySmall: TextStyle(
                fontSize: 20, // Set the desired font size
                color: Colors.black,
              ),
              bodyMedium: TextStyle(
                fontSize: 15, // Set the desired font size
                color: Colors.black,
              )),
        ),
        home: const MyHomePage());
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<ItemContent> Content = [];

  int _nowMoney = 300000000;
  int _incomeMoney = 0;
  int _expeditureMoney = 0;

  void getContent(name, money) {
    DateTime now = DateTime.now();
    int day = now.day;
    int month = now.month;
    int year = now.year;

    String date = '$day/$month/$year';
    final newContent =
        ItemContent(name: name, date: date, money: money, id: now.toString());
    setState(() {
      int numMoney = int.parse(money);
      Content.add(newContent);
      _nowMoney += numMoney;
      if (numMoney > 0) {
        _incomeMoney += numMoney;
      } else {
        _expeditureMoney += numMoney;
      }
    });
  }

  void deleteContent(String id, String smoney) {
    setState(() {
      int money = int.parse(smoney);
      Content.removeWhere((item) => item.id == id);
      _nowMoney -= money;
      if (money > 0) {
        _incomeMoney -= money;
      } else {
        _expeditureMoney -= money;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CardBalance(
            nowMoney: _nowMoney,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Text('Finance Balance',
                style: Theme.of(context).textTheme.bodySmall),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardFinance(
                  reveOrExpend: 'Income',
                  money: _incomeMoney,
                  colorFinance: Colors.green.shade500),
              CardFinance(
                reveOrExpend: 'expenditure',
                money: _expeditureMoney,
                colorFinance: Colors.red.shade500,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Text('Budget Setting',
                style: Theme.of(context).textTheme.bodySmall),
          ),
          //Wrap SingleChildScrollView with Expanded
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: Content.map((item) => CardSpendingContent(
                      name: item.name,
                      date: item.date,
                      money: item.money,
                      id: item.id,
                      deleteContent: deleteContent,
                    )).toList(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => InputContent(getInput: getContent)));
        },
        backgroundColor: const Color(0xFFd9342e),
        child: const Icon(
          Icons.add,
          size: 40,
        ),
      ),
    );
  }
}
