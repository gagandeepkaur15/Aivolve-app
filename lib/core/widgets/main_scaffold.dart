import 'package:aivolve/core/widgets/bg.dart';
import 'package:aivolve/core/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MainScaffold extends StatefulWidget {
  final Widget child;

  const MainScaffold({super.key, required this.child});

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class _MainScaffoldState extends State<MainScaffold> {
  int selectedIndex = 0;

  final tabs = ["/home", "/features", "/ai", "/goals", "/profile"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(child: AivolveBackground(child: widget.child)),
      bottomNavigationBar: BottomBar(
        selectedIndex: selectedIndex,
        onTap: (i) {
          setState(() => selectedIndex = i);
          context.go(tabs[i]);
        },
      ),
    );
  }
}
