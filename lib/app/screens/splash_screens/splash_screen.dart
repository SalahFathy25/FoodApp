import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/screens/onboarding_screen/onboarding_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/utils/colors.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/background.png'),
              fit: BoxFit.cover,
            ),
            color: primaryColor,
          ),
        ),
        AnimatedSplashScreen(
          splash: Image.asset(
            'assets/images/white_logo.png',
            height: 70,
          ),
          nextScreen: const OnboardingScreen(),
          splashTransition: SplashTransition.slideTransition,
          pageTransitionType: PageTransitionType.rightToLeftWithFade,
          backgroundColor: Colors.transparent,
          duration: 2500,
        ),
      ],
    );
  }
}
