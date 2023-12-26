import 'package:flutter/material.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({
    super.key,
    required this.nowMoney,
  });
  final int nowMoney;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: const Color(0xFFd9342e),
      // Box great
      child: Padding(
        padding: const EdgeInsets.only(left: 25, top: 60, bottom: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hi, Dang',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text('Welcome back!',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 25, fontWeight: FontWeight.bold)),
            const SizedBox(
              height: 15,
            ),
            Text('$nowMoney VND',
                style: Theme.of(context)
                    .textTheme
                    .bodyLarge
                    ?.copyWith(fontSize: 40, fontWeight: FontWeight.bold)),
            Text(
              'Your Balance',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
    );
  }
}
