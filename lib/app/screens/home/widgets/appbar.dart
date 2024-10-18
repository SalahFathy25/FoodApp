import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget appBar() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset('assets/images/black_logo.png'),
          const Text(
            'Order your favourite food!',
            style: TextStyle(
              fontWeight: FontWeight.w400,
              color: smallTextColor,
              fontSize: 17,
            ),
          ),
        ],
      ),
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundColor: primaryColor,
          child: Image.asset(
            'assets/images/profile.png',
            fit: BoxFit.cover,
          ),
        ),
      ),
    ],
  );
}
