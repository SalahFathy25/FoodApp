import 'package:flutter/material.dart';
import 'package:svg_flutter/svg.dart';

Widget logosWidget() {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      SvgPicture.asset('assets/images/google_icon.svg'),
      SvgPicture.asset('assets/images/facebook_icon.svg'),
      SvgPicture.asset('assets/images/twitter_icon.svg'),
    ],
  );
}
