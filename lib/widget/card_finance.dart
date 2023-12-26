import 'package:flutter/material.dart';

class CardFinance extends StatelessWidget {
  const CardFinance({
    super.key,
    required this.reveOrExpend,
    required this.money,
    required this.colorFinance,
  });
  final String reveOrExpend;
  final int money;
  final Color colorFinance;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 95,
      width: 180,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 3,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 7),
            child: Text(reveOrExpend,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(fontSize: 15)),
          ),
          Text('$money VND',
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: colorFinance, fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
