import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget orTextWidget(BuildContext context) {
  return SizedBox(
    width: double.infinity,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Divider(
            thickness: 2,
            endIndent: 5,
          ),
        ),
        const Text(
          'OR',
          style: TextStyle(
            color: primaryColor,
          ),
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.4,
          child: const Divider(
            thickness: 2,
            indent: 5,
          ),
        )
      ],
    ),
  );
}
