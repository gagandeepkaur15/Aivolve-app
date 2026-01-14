import 'package:flutter/material.dart';

class AnimatedPathPainter extends CustomPainter {
  final Animation<double> animation;

  AnimatedPathPainter({required this.animation}) : super(repaint: animation);

  @override
void paint(Canvas canvas, Size size) {
  final path = _createSnakePath(size);
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

  // 🔥 Two parallel lines
  final strokePaint = Paint()
    ..shader = gradient
    ..style = PaintingStyle.stroke
    ..strokeWidth = 2
    ..strokeCap = StrokeCap.round
    ..strokeJoin = StrokeJoin.round;

  canvas.drawPath(leftPath, strokePaint);
  canvas.drawPath(rightPath, strokePaint);
}



  Path _createSnakePath(Size size) {
  const r = 24.0;
  final hGap = size.height / 4;
  final path = Path();

  final centerX = size.width / 2;

  // ─── START: vertical line down from center ───
  final startOffset = hGap * 0.5;
  path.moveTo(centerX, startOffset);
  path.lineTo(centerX, hGap - r); 
  
  // ─── SOFT TURN TO RIGHT ───
  path.quadraticBezierTo(
    centerX,
    hGap,
    centerX + r,
    hGap,
  );

  // ─── CONTINUE RIGHT ───
  path.lineTo(size.width - r, hGap);
  path.quadraticBezierTo(size.width, hGap, size.width, hGap + r);

  // ─── SECOND LOOP DOWN ───
  path.lineTo(size.width, hGap * 2 - r);
  path.quadraticBezierTo(size.width, hGap * 2, size.width - r, hGap * 2);

  // ─── RIGHT → LEFT ───
  path.lineTo(r, hGap * 2);
  path.quadraticBezierTo(0, hGap * 2, 0, hGap * 2 + r);

  // ─── LEFT → RIGHT ───
  path.lineTo(0, hGap * 3 - r);
  path.quadraticBezierTo(0, hGap * 3, r, hGap * 3);

  path.lineTo(size.width - r, hGap * 3);
  path.quadraticBezierTo(size.width, hGap * 3, size.width, hGap * 3 + r);

  // ─── RIGHT → LEFT ───
  path.lineTo(size.width, size.height - r);
  path.quadraticBezierTo(
    size.width,
    size.height,
    size.width - r,
    size.height,
  );

  path.lineTo(r, size.height);
  path.quadraticBezierTo(0, size.height, 0, size.height);

  return path;
}





  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
