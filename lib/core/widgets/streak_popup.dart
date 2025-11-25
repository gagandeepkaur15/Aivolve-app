import 'package:aivolve/core/widgets/primary_button.dart';
import 'package:aivolve/core/widgets/ring_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';

void showStreakPopup(BuildContext context, {required int streakCount}) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => StreakPopup(streakCount: streakCount),
  );
}

class StreakPopup extends StatelessWidget {
  final int streakCount;

  const StreakPopup({super.key, required this.streakCount});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.r),
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [Color(0xFF071A67), Color(0xFF021139)],
            ),
          ),
          child: Stack(
            children: [
              /// TOP RINGS (same as premium)
              Positioned(
                top: -200,
                right: -120,
                child: SizedBox(
                  width: 350.w,
                  height: 350.h,
                  child: CustomPaint(painter: RingPainter()),
                ),
              ),

              /// CLOSE ICON
              Positioned(
                top: 0,
                right: 0,
                child: GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: const Icon(Icons.close, color: Colors.white, size: 22),
                ),
              ),

              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Lottie.asset(
                    'assets/streak_animation.json',
                    repeat: true,
                    height: 200.h,
                    fit: BoxFit.cover,
                    alignment: Alignment.topCenter,
                  ),

                  Text(
                    "Amazing Work!",
                    textAlign: TextAlign.center,
                    style: AivolveTextStyles.heading,
                  ),

                  SizedBox(height: 4.h),

                  Text(
                    "$streakCount Days Streak",
                    textAlign: TextAlign.center,
                    style: AivolveTextStyles.subHeading,
                  ),

                  SizedBox(height: 18.h),

                  Text(
                    "You’re building consistency.\nEvery day you show up, you grow stronger!",
                    textAlign: TextAlign.center,
                    style: AivolveTextStyles.paragraph.copyWith(
                      fontSize: 14.sp,
                      color: AivolveColors.textPrimary.withOpacity(0.9),
                    ),
                  ),

                  SizedBox(height: 28.h),

                  PrimaryButton(
                    text: "Alright",
                    onPressed: () => Navigator.pop(context),
                  ),
                ], 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
