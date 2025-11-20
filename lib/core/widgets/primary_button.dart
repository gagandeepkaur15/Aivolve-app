import 'package:flutter/material.dart';
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
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        color: AivolveColors.neonGreen,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(40),
        onTap: onPressed,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 2),
          child: Center(
            child: isLoading
                ? const SizedBox(
                    height: 20,
                    width: 20,
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
