import 'package:flutter/material.dart';

class RouteNotFoundScreen extends StatelessWidget {
  final Exception? error;
  const RouteNotFoundScreen({super.key, this.error});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('404 — Page not found\n${error ?? ''}'),
      ),
    );
  }
}
