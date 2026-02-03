import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:aivolve/core/widgets/tile_card.dart';
import 'package:aivolve/core/features/progress/presentation/widgets/performance_graph.dart';
import 'package:aivolve/core/features/progress/presentation/widgets/streak_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          StreakCalendar(
  streakStart: DateTime(2025, 1, 16),
  streakEnd: DateTime(2025, 1, 24),
),
PerformanceGraph(),
SizedBox(height: 24.h),
Text(
          "Recent Activities",
          style: AivolveTextStyles.heading2.copyWith(fontSize: 18.sp),
        ),
        SizedBox(height: 12.h),
TileCard(title: "Meet with coach", status: "Completed", icon: Icons.edit, showStatus: true,),
 
        ],
      ),
    );
  }
}