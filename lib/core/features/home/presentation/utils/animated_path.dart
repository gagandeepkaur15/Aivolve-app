import 'package:flutter/material.dart';

Path createSnakePath(Size size) {
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