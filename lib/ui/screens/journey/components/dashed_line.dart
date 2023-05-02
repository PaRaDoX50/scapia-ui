import 'package:flutter/material.dart';

class DashedLine extends StatelessWidget {
  final double dashWidth;
  final double dashHeight;
  final Color color;

  const DashedLine(
      {super.key,
      this.dashWidth = 5,
      this.dashHeight = 1,
      this.color = Colors.black});

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _DashedLinePainter(dashWidth, dashHeight, color),
    );
  }
}

class _DashedLinePainter extends CustomPainter {
  final double dashWidth;
  final double dashHeight;
  final Color color;

  _DashedLinePainter(this.dashWidth, this.dashHeight, this.color);

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = color
      ..strokeWidth = dashHeight
      ..style = PaintingStyle.stroke;

    double startX = 0;
    double endX = size.width;
    double centerY = size.height / 2;

    while (startX < endX) {
      canvas.drawLine(
          Offset(startX, centerY), Offset(startX + dashWidth, centerY), paint);
      startX += 2 * dashWidth;
    }
  }

  @override
  bool shouldRepaint(_DashedLinePainter oldDelegate) => false;
}
