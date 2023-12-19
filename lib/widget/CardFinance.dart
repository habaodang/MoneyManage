
import 'package:flutter/material.dart';

class CardFinance extends StatelessWidget {
  const CardFinance({
    super.key,
  });

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
            child: Text('Income',
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.merge(const TextStyle(fontSize: 15))),
          ),
          Text('Rp. 3.000.000',
              style: Theme.of(context).textTheme.bodySmall?.merge(
                  const TextStyle(
                      color: Color.fromARGB(255, 77, 179, 69),
                      fontWeight: FontWeight.bold))),
        ],
      ),
    );
  }
}