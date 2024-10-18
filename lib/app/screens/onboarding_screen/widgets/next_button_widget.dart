import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget nextbuttonwidget(int pageIndex, PageController pageController) {
  return SizedBox(
    width: 75,
    height: 75,
    child: Stack(
      children: [
        SizedBox(
          width: 68,
          height: 68,
          child: CircularProgressIndicator(
            value: (pageIndex + 1) / 3,
            color: Colors.black.withOpacity(.2),
            strokeWidth: 4,
            strokeCap: StrokeCap.round,
            backgroundColor: Colors.black.withOpacity(.2),
            valueColor: const AlwaysStoppedAnimation(primaryColor),
          ),
        ),
        Positioned(
          left: 4,
          top: 4,
          child: InkWell(
            onTap: () {
              if (pageIndex != 2) {
                pageController.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeIn,
                );
              }
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 8),
              width: 60,
              height: 60,
              decoration: const BoxDecoration(
                color: primaryColor,
                shape: BoxShape.circle,
              ),
              child: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 30,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
