import 'package:flutter/material.dart';

class GreenLineContainer extends StatelessWidget {
  const GreenLineContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 2,
      color: Colors.green,
    );
  }
}

class DotContainer extends StatelessWidget {
  final bool isLastTile;
  final Color color;
  final Color borderColor;
  const DotContainer(
      {super.key,
      required this.isLastTile,
      required this.color,
      required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          border: Border.all(
              color: isLastTile ? Colors.red.shade100 : borderColor, width: 4),
          color: isLastTile ? Colors.red : color),
      width: 18,
      height: 18,
    );
  }
}
