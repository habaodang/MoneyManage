import 'package:flutter/material.dart';
import 'package:myapp/item/ItemSpendingContent.dart';
import 'package:myapp/widget/CardBalance.dart';
import 'package:myapp/widget/CardFinance.dart';
import 'package:myapp/widget/CardSpendingContent.dart';

import 'widget/InputContent.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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

  void getContent(name, money) {
    DateTime now = DateTime.now();
    int day = now.day;
    int month = now.month;
    int year = now.year;

    String date = '$day/$month/$year';
    final newContent = ItemContent(name: name, date: date, money: money);
    setState(() {
      Content.add(newContent);
      print(name);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const CardBalance(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 25),
            child: Text('Finance Balance',
                style: Theme.of(context).textTheme.bodySmall),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [CardFinance(), CardFinance()],
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
                    money: item.money)).toList(),
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
