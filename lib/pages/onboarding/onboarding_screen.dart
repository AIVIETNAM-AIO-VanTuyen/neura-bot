import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../constants/colors.dart';
import '../../constants/image_paths.dart';
import 'widgets/onboarding_carousel.dart';
import 'widgets/onboarding_page_indicator.dart';
import 'widgets/onboarding_text_section.dart';
import 'widgets/onboarding_navigation_buttons.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselSliderController _carouselController = CarouselSliderController();
  int _currentIndex = 0;

  final List<Map<String, String>> _onboardingData = [
    {
      'titleStart': '',
      'titleAccent': '',
      'subtitle': 'Your personal AI assistant, 24/7 Talk smart.Think faster.',
      'image': AppImagePaths.intro1,
    },
    {
      'titleStart': 'Why Choose ',
      'titleAccent': 'NeuraBotAI',
      'subtitle':
          '"One Chat. Unlimited Possibilities."\nYour everyday AI for anything, anytime',
      'image': AppImagePaths.intro2,
    },
    {
      'titleStart': 'Private & ',
      'titleAccent': 'Personalized',
      'subtitle':
          'Your data stays safe, and every reply is tailored just for you.',
      'image': AppImagePaths.intro3,
    },
  ];

  @override
  void initState() {
    super.initState();
    _markOnboardingSeen();
  }

  Future<void> _markOnboardingSeen() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  Future<void> _navigateToLogin() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('hasSeenOnboarding', true);
    if (mounted) {
      context.go('/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    final currentData = _onboardingData[_currentIndex];

    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 47),
              
              // 1. Carousel Slider Image Section
              OnboardingCarousel(
                carouselController: _carouselController,
                itemCount: _onboardingData.length,
                onboardingData: _onboardingData,
                onPageChanged: _onPageChanged,
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    
                    // 2. Page Dots Indicator
                    OnboardingPageIndicator(
                      currentIndex: _currentIndex,
                      itemCount: _onboardingData.length,
                    ),

                    const SizedBox(height: 32),

                    // 3. Main Text content (Title & Subtitle)
                    OnboardingTextSection(
                      titleStart: currentData['titleStart']!,
                      titleAccent: currentData['titleAccent']!,
                      subtitle: currentData['subtitle']!,
                    ),

                    const SizedBox(height: 12),
                  ],
                ),
              ),
              
              const SizedBox(height: 20),
              
              // 4. Navigation controls bar
              OnboardingNavigationButtons(
                currentIndex: _currentIndex,
                itemCount: _onboardingData.length,
                onSkip: _navigateToLogin,
                onGetStarted: _navigateToLogin,
                onNext: () {
                  _carouselController.nextPage(
                    duration: const Duration(milliseconds: 300),
                    curve: Curves.easeInOut,
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
