import 'package:flutter/material.dart';

class StripeCard extends StatelessWidget {
  const StripeCard({
    super.key,
    required this.cardColor,
  });

  final Color cardColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(color: Colors.white),
          height: 15,
          width: 4.0,
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(color: Colors.black),
          height: 15,
          width: 5.0,
        ),
      ],
    );
  }
}
