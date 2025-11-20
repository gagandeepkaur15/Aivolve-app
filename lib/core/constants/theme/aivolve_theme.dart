import 'package:flutter/material.dart';
import 'colors.dart';

class AivolveTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AivolveColors.backgroundDeep,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AivolveColors.fieldFill,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AivolveColors.textSecondary),
      labelStyle: TextStyle(color: AivolveColors.textSecondary),
      contentPadding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
    ),
  );
}
