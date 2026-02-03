import 'package:flutter/material.dart';

class GlowBorderPainter extends CustomPainter {
  final double radius;

  GlowBorderPainter({required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final rect = Rect.fromLTWH(0, 0, size.width, size.height);
    final rrect = RRect.fromRectAndRadius(
      rect,
      Radius.circular(radius),
    );

    final gradient = const LinearGradient(
      colors: [
        Color(0xFFDF73FA),
        Color(0xFF7385FA),
      ],
    ).createShader(rect);

    // Glow paint
    final glowPaint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 12);

    canvas.drawRRect(rrect, glowPaint);

    // Sharp border
    final borderPaint = Paint()
      ..shader = gradient
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    canvas.drawRRect(rrect, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
