import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AivolveTextStyles {
  static final heading = GoogleFonts.spaceGrotesk(
    fontSize: 30,
    fontWeight: FontWeight.bold,
    color: AivolveColors.neonBlue,
  );

  static final subHeading = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AivolveColors.textPrimary,
  );

  static final buttonText = GoogleFonts.spaceGrotesk(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: AivolveColors.textPrimary,
  );
}
