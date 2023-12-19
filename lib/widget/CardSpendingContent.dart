import 'package:flutter/material.dart';

class CardSpendingContent extends StatelessWidget {
  const CardSpendingContent({
    super.key,
    required this.name,
    required this.date,
    required this.money,
  });

  final name;
  final date;
  final money;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 25),
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: const Color.fromARGB(255, 77, 179, 69),
              ),
              child: const Icon(
                Icons.attach_money_rounded,
                color: Colors.white,
                size: 40,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 17, right: 90),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(name, style: Theme.of(context).textTheme.bodyMedium),
                  Text(date, style: Theme.of(context).textTheme.bodyMedium)
                ],
              ),
            ),
            Text(money, style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
      ),
    );
  }
}
