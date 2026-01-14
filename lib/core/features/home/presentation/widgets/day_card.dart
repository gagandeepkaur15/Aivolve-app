import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DayCard extends StatelessWidget {
  const DayCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40.0),
      child: Container(
        height: 78.h,
        padding: EdgeInsets.all(2.sp), 
        decoration: BoxDecoration(
      gradient: LinearGradient(
        colors: [
          AivolveColors.lightBlue.withOpacity(0.5),
          AivolveColors.violet.withOpacity(0.5),
        ],
      ),
      borderRadius: BorderRadius.circular(12.r),
        ),
        child: Container(
          height: 74.h,
          padding: EdgeInsets.symmetric(horizontal: 12.w),
          decoration: BoxDecoration(
          color: AivolveColors.background,
            borderRadius: BorderRadius.circular(12.r),           
          ),
          child: Row(
            children: [
              // Left Icon Tile
              Container(
                width: 45.w,
                height: 45.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: AivolveColors.lightBlue.withOpacity(0.25),
                ),
                child: const Icon(
                  Icons.edit,
                  color: Colors.white,
                  size: 28,
                ),
              ),
              SizedBox(width: 16.w),       
              // Middle Content
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Meet with coach",
                      style: AivolveTextStyles.subHeading.copyWith(fontSize: 18.sp)
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      children: [
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
                          "Completed",
                          style: AivolveTextStyles.paragraph.copyWith(fontSize: 12.sp),
                        ),
                        const Spacer(),
                        const Icon(
                    Icons.calendar_month,
                    color: AivolveColors.skyBlue,
                    size: 16,
                  ),
                  SizedBox(width: 6.w),
                  Text(
                    "10 Oct 2025",
                     style: AivolveTextStyles.paragraph.copyWith(fontSize: 12.sp, color: AivolveColors.skyBlue),
                  ),
                      ],
                    ),
                  ],
                ),
              ),            
            ],
          ),
        ),
      ),
    );
  }
}
