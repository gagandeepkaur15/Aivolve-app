import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../constants/theme/colors.dart';
import '../constants/theme/text_styles.dart';

class PrimaryButton extends StatelessWidget {
  final String text;
  bool isLoading;
  final VoidCallback onPressed;

  PrimaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.sp),
        color: AivolveColors.neonGreen,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(40.sp),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(text, style: AivolveTextStyles.buttonText),
          ),
        ),
      ),
    );
  }
}

class SecondaryButton extends StatelessWidget {
  final String text;
  bool isLoading;
  final VoidCallback onPressed;

  SecondaryButton({
    super.key,
    required this.text,
    this.isLoading = false,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40.sp),
        color: AivolveColors.neonBlue,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(40.sp),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Center(
            child: isLoading
                ? SizedBox(
                    height: 20.h,
                    width: 20.w,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                    ),
                  )
                : Text(
                    text,
                    style: AivolveTextStyles.buttonText.copyWith(
                      color: Colors.black,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
