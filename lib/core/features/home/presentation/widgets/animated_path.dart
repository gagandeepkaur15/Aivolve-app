import 'package:aivolve/core/features/home/presentation/widgets/animated_path_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedPath extends StatefulWidget {
  const AnimatedPath({super.key});

  @override
  State<AnimatedPath> createState() => _AnimatedPathState();
}

class _AnimatedPathState extends State<AnimatedPath>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 3),
    );
    _controller.forward();

  }

  

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
Widget build(BuildContext context) {
  final width = MediaQuery.of(context).size.width * 0.9;

  return CustomPaint(
    size: Size(width, 500.w), 
    painter: AnimatedPathPainter(animation: _controller),
  );
}

}

