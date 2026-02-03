import 'package:aivolve/core/widgets/primary_button.dart';
import 'package:aivolve/core/widgets/tile_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';

class TaskScreen extends StatelessWidget {
  const TaskScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              AivolveColors.backgroundDeep,
              AivolveColors.background,
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [

            /// ---------- TITLE ----------
            Positioned(
              top: 70.h,
              left: 24.w,
              right: 24.w,
              child: Text(
                "Today, greet someone you don't usually talk to.\nLog how it went.",
                textAlign: TextAlign.center,
                style: AivolveTextStyles.paragraph.copyWith(
                  fontSize: 18.sp,
                  color: AivolveColors.textPrimary,
                ),
              ),
            ),

            /// ---------- RIPPLE CIRCLES ----------
            _ripple(280, AivolveColors.neonViolet.withOpacity(0.12)),
            _ripple(210, AivolveColors.neonPurple.withOpacity(0.18)),
            _ripple(150, AivolveColors.violet.withOpacity(0.25)),

            /// ---------- MIC BUTTON ----------
            Container(
              width: 90.w,
              height: 90.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: const LinearGradient(
                  colors: [
                    AivolveColors.neonPurple,
                    AivolveColors.neonViolet,
                  ],
                ),
                boxShadow: [
                  BoxShadow(
                    color: AivolveColors.neonPurple.withOpacity(0.6),
                    blurRadius: 25,
                    spreadRadius: 2,
                  ),
                ],
              ),
              child: const Icon(
                Icons.mic,
                size: 42,
                color: AivolveColors.textPrimary,
              ),
            ),

            /// ---------- COACH TIP CARD ----------
            
            Positioned(
              bottom: 10.h,
              left: 24.w,
              right: 24.w,
              child: Column(
                children: [
                  TileCard(title: "Coach Tip", status: "Make eye contact and speak clearly", icon: Icons.lightbulb_outline, showStatus: false),
                  SizedBox(height: 30.h),
                  PrimaryButton(text: "Submit", onPressed: (){})
                ],
              ),
              // child: Container(
              //   padding: EdgeInsets.all(16.sp),
              //   decoration: BoxDecoration(
              //     color: AivolveColors.glassBg.withOpacity(0.65),
              //     borderRadius: BorderRadius.circular(16.sp),
              //     border: Border.all(
              //       color: AivolveColors.neonBlue.withOpacity(0.2),
              //     ),
              //     boxShadow: [
              //       BoxShadow(
              //         color: AivolveColors.neonBlue.withOpacity(0.15),
              //         blurRadius: 20,
              //       ),
              //     ],
              //   ),
              //   child: Row(
              //     children: [
              //       Container(
              //         padding: EdgeInsets.all(10.sp),
              //         decoration:  BoxDecoration(
              //           shape: BoxShape.circle,
              //           color: AivolveColors.backgroundDark,
              //         ),
              //         child: const Icon(
              //           Icons.lightbulb_outline,
              //           color: AivolveColors.neonBlue,
              //         ),
              //       ),
              //       SizedBox(width: 12.w),
              //       Column(
              //         crossAxisAlignment: CrossAxisAlignment.start,
              //         children: [
              //           Text("Coach Tip", style: AivolveTextStyles.subHeading),
              //           SizedBox(height: 4.h),
              //           Text(
              //             "Make eye contact and speak clearly",
              //             style: AivolveTextStyles.paragraph.copyWith(
              //               color: AivolveColors.textSecondary,
              //             ),
              //           ),
              //         ],
              //       )
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _ripple(double size, Color color) {
    return Container(
      width: size.w,
      height: size.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
    );
  }
}
