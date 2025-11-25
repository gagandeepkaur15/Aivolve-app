import 'package:aivolve/core/widgets/primary_button.dart';
import 'package:aivolve/core/widgets/ring_painter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';

void showAivolvePremiumPopup(BuildContext context) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) => const PremiumPopup(),
  );
}

class PremiumPopup extends StatelessWidget {
  const PremiumPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      insetPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 24.h),
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
              /// TOP RINGS
              Positioned(
                top: -200,
                right: -120,
                child: SizedBox(
                  width: 350.w,
                  height: 350.h,
                  child: CustomPaint(painter: RingPainter()),
                ),
              ),

              /// CONTENT
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset('assets/buy_premium_bot.png', height: 200.h),

                  Text(
                    "Hey you are doing so well!",
                    style: AivolveTextStyles.heading,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "I would suggest going premium",
                    style: AivolveTextStyles.subHeading,
                  ),

                  SizedBox(height: 38.h),

                  /// FEATURES ROW
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      _PremiumFeatureBox(title: "Unlimited\nRoleplays"),
                      _PremiumFeatureBox(title: "Advanced\nAnalytics"),
                      _PremiumFeatureBox(title: "Custom\nScenarios"),
                    ],
                  ),

                  SizedBox(height: 32.h),

                  /// BUY BUTTON
                  PrimaryButton(text: 'Buy Premium', onPressed: () {}),

                  SizedBox(height: 16.h),

                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: Text("Not Now", style: AivolveTextStyles.paragraph),
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

class _PremiumFeatureBox extends StatelessWidget {
  final String title;

  const _PremiumFeatureBox({required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // === OUTER GRADIENT BORDER ===
        Container(
          padding: EdgeInsets.all(2.h),
          decoration: BoxDecoration(
            gradient: const LinearGradient(
              colors: [AivolveColors.neonPurple, AivolveColors.neonViolet],
            ),
            borderRadius: BorderRadius.circular(18.sp),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 20.h, horizontal: 16.w),
            decoration: BoxDecoration(
              color: AivolveColors.backgroundDeep,
              borderRadius: BorderRadius.circular(16.sp),
            ),
            child: Column(
              children: [
                Text(
                  title,
                  textAlign: TextAlign.center,
                  style: AivolveTextStyles.paragraph.copyWith(fontSize: 12.sp),
                ),
              ],
            ),
          ),
        ),

        // === TOP GRADIENT CIRCLE BADGE ===
        Positioned(
          top: -20.h,
          left: 0,
          right: 0,
          child: Container(
            width: 40.w,
            height: 40.h,
            padding: EdgeInsets.all(3.h),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              gradient: const LinearGradient(
                colors: [Color(0xFFDF73FA), Color(0xFF7385FA)],
              ),
            ),
            child: Container(
              decoration: BoxDecoration(
                color: AivolveColors.backgroundDeep,
                shape: BoxShape.circle,
              ),
              child: Icon(
                Icons.check_circle,
                color: AivolveColors.neonGreen,
                size: 26.sp,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
