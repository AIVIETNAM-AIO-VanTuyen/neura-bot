import 'package:flutter/material.dart';
import '../../../constants/styles.dart';

class OnboardingNavigationButtons extends StatelessWidget {
  final int currentIndex;
  final int itemCount;
  final VoidCallback onSkip;
  final VoidCallback onGetStarted;
  final VoidCallback onNext;

  const OnboardingNavigationButtons({
    super.key,
    required this.currentIndex,
    required this.itemCount,
    required this.onSkip,
    required this.onGetStarted,
    required this.onNext,
  });

  @override
  Widget build(BuildContext context) {
    if (currentIndex == itemCount - 1) {
      // Last Screen: Wide 'Get Started' button
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: onGetStarted,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(0xFF2563EB), // Vibrant royal blue color
              foregroundColor: Colors.white,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26),
              ),
            ),
            child: Text(
              'Get Started',
              style: AppStyles.button.copyWith(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      );
    }

    // First and Second Screens
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        height: 52,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            // Skip Button (Only visible on slide index > 0, otherwise empty space)
            currentIndex > 0
                ? TextButton(
                    onPressed: onSkip,
                    child: Text(
                      'Skip',
                      style: AppStyles.button.copyWith(
                        color: Colors.white.withValues(alpha: 0.6),
                        fontSize: 15,
                      ),
                    ),
                  )
                : const SizedBox(width: 60), // Empty spacer to balance layout

            // Next Button
            SizedBox(
              width: 110,
              height: 44,
              child: ElevatedButton(
                onPressed: onNext,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF2563EB), // Vibrant royal blue color
                  foregroundColor: Colors.white,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22),
                  ),
                ),
                child: Text(
                  'Next',
                  style: AppStyles.button.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
