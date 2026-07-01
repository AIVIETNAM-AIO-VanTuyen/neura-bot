import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import '../../../constants/colors.dart';

class OnboardingCarousel extends StatelessWidget {
  final CarouselSliderController carouselController;
  final int itemCount;
  final List<Map<String, String>> onboardingData;
  final ValueChanged<int> onPageChanged;

  const OnboardingCarousel({
    super.key,
    required this.carouselController,
    required this.itemCount,
    required this.onboardingData,
    required this.onPageChanged,
  });

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      carouselController: carouselController,
      itemCount: itemCount,
      itemBuilder: (context, index, realIndex) {
        return Container(
          width: double.infinity,
          height: 409,
          color: AppColors.primary500,
          child: Image.asset(
            onboardingData[index]['image']!,
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
          onPageChanged(index);
        },
      ),
    );
  }
}
