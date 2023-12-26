import 'package:bjj_manager/common/stripe_card.dart';
import 'package:flutter/material.dart';

class BeltCard extends StatelessWidget {
  const BeltCard({
    super.key,
    required this.cardColor,
    required this.stripes,
  });

  final Color cardColor;
  final double stripes;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(color: cardColor),
          height: 15,
          width: 240.0,
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(color: Colors.black),
          height: 15,
          width: 70.0 - 6 * stripes,
        ),
        for (int i = 0; i < stripes; i++)
          const StripeCard(cardColor: Colors.black),
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: const BoxDecoration(color: Colors.black),
          height: 15,
          width: 2.0,
        ),
        Container(
          margin: const EdgeInsets.all(0.0),
          decoration: BoxDecoration(color: cardColor),
          height: 15,
          width: 8.0,
        ),
      ],
    );
  }
}
