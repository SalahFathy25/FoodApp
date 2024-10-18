import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../core/utils/colors.dart';

Widget indicatorWidget(PageController pageController) {
  return SmoothPageIndicator(
    controller: pageController,
    count: 3,
    effect: const ExpandingDotsEffect(
      activeDotColor: primaryColor,
      dotHeight: 10,
      dotWidth: 10,
      strokeWidth: 2,
    ),
    onDotClicked: (index) {
      pageController.animateToPage(
        index,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOutCubic,
      );
    },
  );
}
