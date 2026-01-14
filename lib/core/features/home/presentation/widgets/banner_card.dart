import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BannerCard extends StatelessWidget {
  const BannerCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none, 
      children: [
        // Card
        Container(
          height: 120,
          decoration: BoxDecoration(
            color: Colors.transparent,
            borderRadius: BorderRadius.circular(24.sp),
            border: Border.all(
              color: AivolveColors.neonBlue,
              width: 2.5,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: const SizedBox(),
                ),
              ),
              const Spacer(), 
            ],
          ),
        ),

        Positioned(
          right: 12,
          top: -20, 
          child: Image.asset(
            "assets/home_bot.png",
            height: 140,
            fit: BoxFit.contain,
          ),
        ),
      ],
    );
  }
}

