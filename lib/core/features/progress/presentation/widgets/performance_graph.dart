import 'package:flutter/material.dart';
import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PerformanceGraph extends StatelessWidget {
  const PerformanceGraph({super.key});

  @override
  Widget build(BuildContext context) {
    final values = [40.0, 70.0, 25.0, 90.0, 60.0, 85.0];

    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
             Text(
          "Weekly Performance",
          style: AivolveTextStyles.heading2.copyWith(fontSize: 18.sp),
        ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 4.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20.r),
                  border: Border.all(color: AivolveColors.neonPurple, width: 1.5.w),
                ),
                child: Row(
                  children: [
                    Text('Week 1', style: AivolveTextStyles.paragraph),
                    SizedBox(width: 6.w),
                    Icon(Icons.keyboard_arrow_down, color: AivolveColors.neonPurple)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 12.h),
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 20.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24.r),
        color: const Color.fromARGB(21, 255, 255, 255)
      ),
       
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(values.length, (i) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: (values[i] * 1.5).h,
                      width: 22.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(6.r),
                        color: AivolveColors.glassBg,
                        border: Border.all(
                          width: 2.w,
                          color: Colors.transparent,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AivolveColors.neonPurple.withOpacity(0.6),
                            blurRadius: 12.r,
                            spreadRadius: 1.r,
                          )
                        ],
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(6.r),
                          gradient: LinearGradient(
                            colors: [AivolveColors.neonPurple, AivolveColors.violet],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text('Day ${i + 1}', style: AivolveTextStyles.paragraph.copyWith(fontSize: 12.sp)),
                  ],
                );
              }),
            ),
          )
        ],
    
    );
  }
}