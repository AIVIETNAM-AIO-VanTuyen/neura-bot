import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../constants/colors.dart';
import '../../constants/styles.dart';
import '../../constants/image_paths.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkOnboardingAndNavigate();
  }

  Future<void> _checkOnboardingAndNavigate() async {
    final prefs = await SharedPreferences.getInstance();
    final hasSeenOnboarding = prefs.getBool('hasSeenOnboarding') ?? false;

    Timer(const Duration(seconds: 2), () {
      if (mounted) {
        if (hasSeenOnboarding) {
          try {
            context.go('/login');
          } catch (_) {
            context.go('/onboarding');
          }
        } else {
          context.go('/onboarding');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                color: AppColors.primary500,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: AppColors.primary500.withValues(alpha: 0.5),
                  width: 2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(28),
                child: Image.asset(
                  AppImagePaths.appLogo,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    return const Icon(
                      Icons.online_prediction_rounded,
                      color: AppColors.primary500,
                      size: 55,
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 24),
            Text(
              'NeuraBot',
              style: AppStyles.headingXL.copyWith(color: AppColors.background),
            ),
          ],
        ),
      ),
    );
  }
}
