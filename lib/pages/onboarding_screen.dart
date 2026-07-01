import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';
import '../constants/image_paths.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final CarouselSliderController _carouselController =
      CarouselSliderController();
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
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary500,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 47),
              // Top Image Area
              CarouselSlider.builder(
                carouselController: _carouselController,
                itemCount: _onboardingData.length,
                itemBuilder: (context, index, realIndex) {
                  return Container(
                    width: double.infinity,
                    height: 409,
                    color: AppColors.primary500,
                    child: Image.asset(
                      _onboardingData[index]['image']!,
                      height: 409,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Center(
                          child: Icon(
                            Icons.image_outlined,
                            size: 100,
                            color: Colors.white.withValues(alpha: 0.3),
                          ),
                        );
                      },
                    ),
                  );
                },
                options: CarouselOptions(
                  height: 409,
                  viewportFraction: 1.0,
                  initialPage: 0,
                  enableInfiniteScroll: false,
                  reverse: false,
                  autoPlay: false,
                  enlargeCenterPage: false,
                  scrollDirection: Axis.horizontal,
                  onPageChanged: (index, reason) {
                    _onPageChanged(index);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 24),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        _onboardingData.length,
                        (index) => Container(
                          margin: const EdgeInsets.symmetric(horizontal: 4.0),
                          width: 8,
                          height: 8,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: _currentIndex == index
                                ? Colors.white
                                : Colors.transparent,
                            border: Border.all(
                              color: Colors.white,
                              width: _currentIndex == index ? 0 : 1.5,
                            ),
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 32),

                    // Title
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        style: AppStyles.headingXL.copyWith(
                          color: Colors.white,
                          fontSize: 24,
                          height: 1.3,
                        ),
                        children: [
                          TextSpan(
                            text: _onboardingData[_currentIndex]['titleStart'],
                          ),
                          TextSpan(
                            text: _onboardingData[_currentIndex]['titleAccent'],
                            style: const TextStyle(
                              color: Color(0xFF7C3AED), // Premium purple accent
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 16),

                    // Subtitle
                    Text(
                      _onboardingData[_currentIndex]['subtitle']!,
                      textAlign: TextAlign.center,
                      style: AppStyles.bodyRegular.copyWith(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),

                    // Navigation Buttons Bar
                    const SizedBox(height: 12),
                  ],
                ),
              ),
              SizedBox(height: 20),
              _buildNavigationButtons(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavigationButtons() {
    if (_currentIndex == _onboardingData.length - 1) {
      // Last Screen: Wide 'Get Started' button
      return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SizedBox(
          width: double.infinity,
          height: 52,
          child: ElevatedButton(
            onPressed: _navigateToLogin,
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color(
                0xFF2563EB,
              ), // Vibrant royal blue color from screenshot
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
    return SizedBox(
      height: 52,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Skip Button (Only visible on slide index > 0, otherwise empty container to align)
          _currentIndex > 0
              ? TextButton(
                  onPressed: _navigateToLogin,
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
              onPressed: () {
                _carouselController.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(
                  0xFF2563EB,
                ), // Vibrant royal blue color from screenshot
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
    );
  }
}
