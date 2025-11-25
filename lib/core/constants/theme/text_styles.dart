import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class AivolveTextStyles {
  static final heading = GoogleFonts.spaceGrotesk(
    fontSize: 30.sp,
    fontWeight: FontWeight.bold,
    color: AivolveColors.neonBlue,
  );

  static final heading2 = GoogleFonts.spaceGrotesk(
    fontSize: 20..sp,
    fontWeight: FontWeight.bold,
    color: AivolveColors.textPrimary,
  );

  static final subHeading = GoogleFonts.barlow(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AivolveColors.textPrimary,
  );

  static final paragraph = GoogleFonts.barlow(
    fontSize: 14.sp,
    color: AivolveColors.textPrimary,
  );

  static final buttonText = GoogleFonts.barlow(
    fontSize: 16.sp,
    fontWeight: FontWeight.w600,
    color: AivolveColors.textPrimary,
  );
}
