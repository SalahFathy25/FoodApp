import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class OnBoardingData {
  String image;
  String title;
  String description;

  OnBoardingData({
    required this.image,
    required this.title,
    required this.description,
  });
}

Widget buildOnBoardingItem(OnBoardingData onBoardingData,
    PageController pageController, BuildContext context) {
  return Container(
    decoration: const BoxDecoration(
      color: backgroundPrimaryColor,
    ),
    child: Column(
      children: [
        const SizedBox(height: 35),
        SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height / 2,
          child: Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 145,
                  backgroundColor: primaryColor.withOpacity(.3),
                  child: CircleAvatar(
                    radius: 140,
                    backgroundImage: Image.asset(
                      onBoardingData.image,
                      fit: BoxFit.cover,
                    ).image,
                  ),
                )
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Text(
            onBoardingData.title,
            style: const TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Color.fromARGB(255, 110, 109, 109),
            ),
            textAlign: TextAlign.center,
          ),
        ),
        const SizedBox(height: 20),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18),
          child: Text(
            onBoardingData.description,
            style: const TextStyle(
              fontSize: 18,
              color: Color.fromARGB(255, 139, 138, 138),
              fontWeight: FontWeight.w400,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ],
    ),
  );
}
