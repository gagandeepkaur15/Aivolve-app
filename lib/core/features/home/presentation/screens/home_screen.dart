import 'package:aivolve/core/features/home/presentation/widgets/banner_card.dart';
import 'package:aivolve/core/widgets/bg.dart';
import 'package:aivolve/core/widgets/buy_premium_popup.dart';
import 'package:aivolve/core/widgets/streak_popup.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(child: BannerCard()),
        ElevatedButton(
          onPressed: () {
            showAivolvePremiumPopup(context);
          },
          child: Text("Show Premium Popup"),
        ),

        ElevatedButton(
          onPressed: () {
            showStreakPopup(context, streakCount: 3);
          },
          child: Text("Show streak Popup"),
        ),
      ],
    );
  }
}
