import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:aivolve/core/widgets/glow_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TileCard extends StatelessWidget {
  final String title;
  final String status;
  final IconData icon;
  final bool showStatus;
  const TileCard({super.key, required this.title, required this.status, required this.icon, required this.showStatus});

  @override
  Widget build(BuildContext context) {
    return  CustomPaint(
        painter: GlowBorderPainter(radius: 12.r),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 12.sp, vertical: 8.sp),
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.circular(12.r),
          //   color: const Color.fromARGB(14, 255, 255, 255)
          // ),
          decoration: BoxDecoration(
                  color: AivolveColors.glassBg.withOpacity(0.65),
                  borderRadius: BorderRadius.circular(16.sp),
                  
                  boxShadow: [
                    BoxShadow(
                      color: AivolveColors.neonBlue.withOpacity(0.15),
                      blurRadius: 20,
                    ),
                  ],
                ),
          child: Row(
            children: [
              Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AivolveColors.lightBlue.withOpacity(0.25),
                ),
                child: Icon(
                  icon,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              SizedBox(width: 16.w),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: AivolveTextStyles.subHeading
                          .copyWith(fontSize: 18.sp),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
                        if(showStatus)
                        Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: Color(0xFF6CFF4A),
                            shape: BoxShape.circle,
                          ),
                        ),
                        SizedBox(width: 6.w),
                        Text(
                          status,
                          style: AivolveTextStyles.paragraph
                              .copyWith(fontSize: 12.sp),
                        ),
                        // const Spacer(),
                        // const Icon(
                        //   Icons.calendar_month,
                        //   color: AivolveColors.skyBlue,
                        //   size: 16,
                        // ),
                        // SizedBox(width: 6.w),
                        // Text(
                        //   "10 Oct 2025",
                        //   style: AivolveTextStyles.paragraph.copyWith(
                        //     fontSize: 12.sp,
                        //     color: AivolveColors.skyBlue,
                        //   ),
                        // ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      
    );
  }
}
