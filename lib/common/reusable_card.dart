import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  const ReusableCard({
    super.key,
    required this.cardColor,
    required this.cardChild,
    required this.cardHeight,
  });

  final Color cardColor;
  final Widget cardChild;
  final double cardHeight;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: cardColor, borderRadius: BorderRadius.circular(10.0)),
      height: cardHeight,
      width: 170.0,
      child: cardChild,
    );
  }
}
