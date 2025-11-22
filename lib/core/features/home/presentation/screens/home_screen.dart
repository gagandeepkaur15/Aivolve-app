import 'package:aivolve/core/features/home/presentation/widgets/banner_card.dart';
import 'package:aivolve/core/widgets/bg.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AivolveBackground(child: Center(child: BannerCard())),
      ),
    );
  }
}
