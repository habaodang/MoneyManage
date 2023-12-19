import 'package:flutter/material.dart';

class CardBalance extends StatelessWidget {
  const CardBalance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 230,
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
                style: Theme.of(context).textTheme.bodyLarge?.merge(
                    const TextStyle(
                        fontSize: 25, fontWeight: FontWeight.bold))),
            const Text(''),
            Text('Rp. 3.000.000',
                style: Theme.of(context).textTheme.bodyLarge?.merge(
                    const TextStyle(
                        fontSize: 40, fontWeight: FontWeight.bold))),
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
