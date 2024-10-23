import 'dart:convert';

import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

Widget homeAppBar({required String image}) {
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
          backgroundImage: image.isNotEmpty
              ? MemoryImage(base64Decode(image))
              : const AssetImage('assets/images/no_image.webp')
                  as ImageProvider,
        ),
      ),
    ],
  );
}
