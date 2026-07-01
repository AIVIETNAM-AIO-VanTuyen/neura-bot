import 'package:flutter/material.dart';

class OnboardingPageIndicator extends StatelessWidget {
  final int currentIndex;
  final int itemCount;

  const OnboardingPageIndicator({
    super.key,
    required this.currentIndex,
    required this.itemCount,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        itemCount,
        (index) => Container(
          margin: const EdgeInsets.symmetric(horizontal: 4.0),
          width: 8,
          height: 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index ? Colors.white : Colors.transparent,
            border: Border.all(
              color: Colors.white,
              width: currentIndex == index ? 0 : 1.5,
            ),
          ),
        ),
      ),
    );
  }
}
