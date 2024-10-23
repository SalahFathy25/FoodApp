import 'dart:typed_data';

import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

Widget appBar({required Uint8List? image}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Image.asset('assets/images/black_logo.png'),
      Container(
        width: 60,
        height: 60,
        decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.circular(50),
        ),
        child: CircleAvatar(
          radius: 50,
          backgroundImage: image != null ? MemoryImage(image) : null,
          child: image == null
              ? const Icon(
                  Icons.person,
                  size: 60,
                  color: Colors.white,
                )
              : null,
        ),
      ),
    ],
  );
}
