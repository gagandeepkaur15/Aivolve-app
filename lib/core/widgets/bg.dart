import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';

class AivolveBackground extends StatelessWidget {
  final Widget child;

  const AivolveBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          top: -200,
          right: -200,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [AivolveColors.backgroundDark, Colors.transparent],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
        ),

        Positioned(
          bottom: -200,
          left: -200,
          child: Container(
            width: 500,
            height: 500,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: RadialGradient(
                colors: [AivolveColors.backgroundDark, Colors.transparent],
                stops: const [0.0, 1.0],
              ),
            ),
          ),
        ),
        
        child,
      ],
    );
  }
}
