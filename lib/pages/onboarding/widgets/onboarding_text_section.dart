import 'package:flutter/material.dart';
import '../../../constants/styles.dart';

class OnboardingTextSection extends StatelessWidget {
  final String titleStart;
  final String titleAccent;
  final String subtitle;

  const OnboardingTextSection({
    super.key,
    required this.titleStart,
    required this.titleAccent,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        RichText(
          textAlign: TextAlign.center,
          text: TextSpan(
            style: AppStyles.headingXL.copyWith(
              color: Colors.white,
              fontSize: 24,
              height: 1.3,
            ),
            children: [
              TextSpan(text: titleStart),
              TextSpan(
                text: titleAccent,
                style: const TextStyle(
                  color: Color(0xFF7C3AED), // Premium purple accent
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 16),
        Text(
          subtitle,
          textAlign: TextAlign.center,
          style: AppStyles.bodyRegular.copyWith(
            color: Colors.white,
            fontSize: 20,
          ),
        ),
      ],
    );
  }
}
