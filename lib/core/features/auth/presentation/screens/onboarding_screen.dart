import 'package:aivolve/core/routing/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:aivolve/core/constants/theme/colors.dart';
import 'package:aivolve/core/constants/theme/text_styles.dart';
import 'package:aivolve/core/widgets/primary_button.dart';
import 'package:aivolve/core/widgets/bg.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AivolveOnboarding extends StatefulWidget {
  const AivolveOnboarding({super.key});

  @override
  State<AivolveOnboarding> createState() => _AivolveOnboardingState();
}

class _AivolveOnboardingState extends State<AivolveOnboarding>
    with TickerProviderStateMixin {
  late final PageController _pageController;
  int currentPage = 0;

  final List<int?> selectedOptions = [null, null, null];

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  void nextPage() {
    if (currentPage < 2) {
      _pageController.nextPage(
        duration: const Duration(milliseconds: 450),
        curve: Curves.easeInOut,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: AivolveBackground(
          child: Stack(
            children: [
              PageView(
                physics: const BouncingScrollPhysics(),
                controller: _pageController,
                onPageChanged: (i) => setState(() => currentPage = i),
                children: [
                  _buildQuestion(
                    image: "assets/onboarding_bot1.png",
                    title: "Which of these best describes you?",
                    subtitle:
                        "This helps us tailor your journey based on your life stage.",
                    child: _buildSelectableOptions(0, [
                      "School Student",
                      "College Student / Young Adult",
                      "Job Seeker",
                      "Working Professional",
                    ]),
                  ),

                  _buildQuestion(
                    image: "assets/onboarding_bot2.png",
                    title: "What would you like to improve?",
                    subtitle:
                        "Choose the areas you want to grow in. We’ll personalize your plan accordingly.",
                    child: _buildSelectableOptions(1, [
                      "Communication Skills",
                      "Confidence",
                      "Public Speaking",
                      "Interview Preparation",
                    ]),
                  ),

                  _buildQuestion(
                    image: "assets/onboarding_bot1.png",
                    title: "How would you rate yourself right now?",
                    subtitle:
                        "Your self-rating helps us understand your current level and track your growth.",
                    child: _buildSelectableOptions(2, [
                      "Beginner",
                      "Developing",
                      "Advanced",
                    ]),
                    isLast: true,
                  ),
                ],
              ),

              Positioned(
                bottom: 30.h,
                left: 20.w,
                right: 20.w,
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: currentPage == 2 ? _finishButton() : _nextButton(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildQuestion({
    required String image,
    required String title,
    required String subtitle,
    required Widget child,
    bool isLast = false,
  }) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(child: Image.asset(image, height: 180, fit: BoxFit.contain)),
            SizedBox(height: 16.h),
            Text(title, style: AivolveTextStyles.heading),
            SizedBox(height: 10.h),
            Text(subtitle, style: AivolveTextStyles.subHeading),
            SizedBox(height: 30.h),
            child,
          ],
        ),
      ),
    );
  }

  Widget _buildSelectableOptions(int questionIndex, List<String> options) {
    return Column(
      children: List.generate(options.length, (i) {
        bool isSelected = selectedOptions[questionIndex] == i;

        return GestureDetector(
          onTap: () {
            setState(() => selectedOptions[questionIndex] = i);
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 250),
            curve: Curves.easeOut,
            margin: EdgeInsets.only(bottom: 14.h),
            padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 20.w),
            width: double.infinity,
            decoration: BoxDecoration(
              gradient: isSelected
                  ? LinearGradient(
                      colors: [
                        AivolveColors.backgroundDeep.withOpacity(0.9),
                        AivolveColors.neonBlue.withOpacity(0.1),
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isSelected ? null : AivolveColors.fieldFill,
              borderRadius: BorderRadius.circular(16.sp),
              border: isSelected
                  ? Border.all(
                      color: AivolveColors.neonBlue,
                      width: 2,
                      strokeAlign: BorderSide.strokeAlignOutside,
                    )
                  : null,
              boxShadow: isSelected
                  ? [
                      BoxShadow(
                        color: AivolveColors.neonBlue.withOpacity(0.2),
                        blurRadius: 14,
                        spreadRadius: 2,
                      ),
                    ]
                  : [],
            ),
            child: AnimatedScale(
              duration: const Duration(milliseconds: 200),
              scale: isSelected ? 1.03 : 1.0,
              child: Text(
                options[i],
                style: AivolveTextStyles.paragraph.copyWith(
                  color: isSelected
                      ? AivolveColors.neonBlue
                      : AivolveColors.textPrimary,
                  fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Widget _nextButton() {
    return SecondaryButton(onPressed: nextPage, text: "Next");
  }

  Widget _finishButton() {
    return PrimaryButton(
      onPressed: () => context.go(AppRoutes.home),
      text: "Finish",
    );
  }
}
