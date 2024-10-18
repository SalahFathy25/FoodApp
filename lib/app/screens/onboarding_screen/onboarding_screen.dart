import 'package:flutter/material.dart';

import '../../../core/utils/colors.dart';
import 'lists/onboarding_data_list.dart';
import 'widgets/build_onboarding_item.dart';
import 'widgets/indicator_widget.dart';
import 'widgets/login_and_signup_buttons_widget.dart';
import 'widgets/next_button_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  late PageController pageController;
  int pageIndex = 0;

  @override
  void initState() {
    pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundPrimaryColor,
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              physics: const BouncingScrollPhysics(),
              controller: pageController,
              itemCount: onBoardingData.length,
              itemBuilder: (context, index) {
                return buildOnBoardingItem(
                    onBoardingData[index], pageController, context);
              },
              onPageChanged: (index) {
                setState(
                  () {
                    pageIndex = index;
                  },
                );
              },
            ),
          ),
          indicatorWidget(pageController),
          const SizedBox(height: 20),
          pageIndex == 2
              ? loginandsignupbuttonswiget(context)
              : nextbuttonwidget(pageIndex, pageController),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
