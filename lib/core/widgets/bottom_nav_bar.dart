import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BottomBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onTap;

  const BottomBar({
    super.key,
    required this.selectedIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 78.h,
      width: double.infinity,

      decoration: BoxDecoration(
        color: Color(0xFF020035),

        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(28.r),
          topRight: Radius.circular(28.r),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: List.generate(5, (index) {
          final isSelected = index == selectedIndex;

          return GestureDetector(
            onTap: () => onTap(index),
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              padding: EdgeInsets.all(isSelected ? 10 : 6),

              decoration: const BoxDecoration(shape: BoxShape.circle),

              child: Icon(
                _getIcon(index),
                size: 26.sp,
                color: isSelected ? AivolveColors.neonBlue : Colors.white60,
              ),
            ),
          );
        }),
      ),
    );
  }
}

IconData _getIcon(int index) {
  switch (index) {
    case 0:
      return Icons.home_outlined;
    case 1:
      return Icons.extension_outlined;
    case 2:
      return Icons.smart_toy_outlined;
    case 3:
      return Icons.track_changes_outlined;
    case 4:
      return Icons.person_outline;
    default:
      return Icons.circle;
  }
}
