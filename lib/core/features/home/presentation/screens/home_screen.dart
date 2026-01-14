import 'package:aivolve/core/features/home/presentation/widgets/animated_path.dart';
import 'package:aivolve/core/features/home/presentation/widgets/animated_path_painter.dart';
import 'package:aivolve/core/features/home/presentation/widgets/banner_card.dart';
import 'package:aivolve/core/features/home/presentation/widgets/day_card.dart';
import 'package:aivolve/core/widgets/buy_premium_popup.dart';
import 'package:aivolve/core/widgets/streak_popup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w, vertical: 15.h),
      child: Column(
        children: [
          Center(child: BannerCard()),
          // ElevatedButton(
          //   onPressed: () {
          //     showAivolvePremiumPopup(context);
          //   },
          //   child: Text("Show Premium Popup"),
          // ),
      
          // ElevatedButton(
          //   onPressed: () {
          //     showStreakPopup(context, streakCount: 3);
          //   },
          //   child: Text("Show streak Popup"),
          // ),
          //DayCard(),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: AnimatedPath(),
          )
          
        ],
      ),
    );
  }
}
