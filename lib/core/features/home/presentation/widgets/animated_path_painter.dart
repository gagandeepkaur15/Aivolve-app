import 'package:aivolve/core/features/home/presentation/utils/animated_path.dart';
import 'package:flutter/material.dart';

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> animation;

  AnimatedPathPainter({required this.animation}) : super(repaint: animation);

  @override
void paint(Canvas canvas, Size size) {
  final path = createSnakePath(size);
  final metric = path.computeMetrics().first;

  final length = metric.length * animation.value;

  final leftPath = Path();
  final rightPath = Path();

  const gap = 5.0; 

  for (double d = 0; d < length; d += 1) {
    final tangent = metric.getTangentForOffset(d);
    if (tangent == null) continue;

    final normal = Offset(-tangent.vector.dy, tangent.vector.dx);

    final leftPoint = tangent.position + normal * gap;
    final rightPoint = tangent.position - normal * gap;

    if (d == 0) {
      leftPath.moveTo(leftPoint.dx, leftPoint.dy);
      rightPath.moveTo(rightPoint.dx, rightPoint.dy);
    } else {
      leftPath.lineTo(leftPoint.dx, leftPoint.dy);
      rightPath.lineTo(rightPoint.dx, rightPoint.dy);
    }
  }

  final gradient = LinearGradient(
    colors: const [
      Color(0xFFDF73FA),
      Color(0xFF7385FA),
    ],
  ).createShader(Rect.fromLTWH(0, 0, size.width, size.height));

  // 🌫️ Glow (behind both)
  final glowPaint = Paint()
    ..shader = gradient
    ..style = PaintingStyle.stroke
    ..strokeWidth = 6
    ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10);

  canvas.drawPath(leftPath, glowPaint);
  canvas.drawPath(rightPath, glowPaint);

  // Two parallel lines
  final strokePaint = Paint()
    ..shader = gradient
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  canvas.drawPath(leftPath, strokePaint);
  canvas.drawPath(rightPath, strokePaint);
}
  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
