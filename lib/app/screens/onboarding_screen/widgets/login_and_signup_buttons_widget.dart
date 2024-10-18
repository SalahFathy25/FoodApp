import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';


Widget loginandsignupbuttonswiget(BuildContext context) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20),
    child: Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/login',
              (route) => false,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: primaryColor,
            ),
            child: const Center(
              child: Text(
                'Login',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/register',
              (route) => false,
            );
          },
          child: Container(
            margin: const EdgeInsets.symmetric(vertical: 5),
            width: MediaQuery.of(context).size.width,
            height: 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              border: Border.all(color: primaryColor, width: 1),
            ),
            child: const Center(
              child: Text(
                'Register',
                style: TextStyle(
                  color: primaryColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
