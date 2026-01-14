import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'colors.dart';

class AivolveTheme {
  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    scaffoldBackgroundColor: AivolveColors.background,

    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AivolveColors.fieldFill,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12.sp),
        borderSide: BorderSide.none,
      ),
      hintStyle: TextStyle(color: AivolveColors.textSecondary),
      labelStyle: TextStyle(color: AivolveColors.textSecondary),
      contentPadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
    ),
  );
}
