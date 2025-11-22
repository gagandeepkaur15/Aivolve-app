import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(24.sp),
        border: Border.all(color: AivolveColors.neonBlue, width: 2.5),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              color: Colors.transparent,
              padding: const EdgeInsets.all(20),
              child: const SizedBox(),
            ),
          ),
          Expanded(
            flex: 1,
            child: Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/home_bot.png"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
