import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/colors.dart';

Widget orderSummaryWidget() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        'Order summary',
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
          fontFamily: GoogleFonts.poppins().fontFamily,
        ),
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Order',
            style: TextStyle(
              color: const Color(0xff7D7D7D),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          Text(
            '\$16.48',
            style: TextStyle(
              color: const Color(0xff7D7D7D),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Taxes',
            style: TextStyle(
              color: const Color(0xff7D7D7D),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          Text(
            '\$0.3',
            style: TextStyle(
              color: const Color(0xff7D7D7D),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
        ],
      ),
      const SizedBox(height: 10),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Delivery fees',
            style: TextStyle(
              color: const Color(0xff7D7D7D),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          Text(
            '\$1.5',
            style: TextStyle(
              color: const Color(0xff7D7D7D),
              fontSize: 18,
              fontWeight: FontWeight.w400,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Total:',
            style: TextStyle(
              color: bigTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          Text(
            '\$18.28',
            style: TextStyle(
              color: bigTextColor,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
        ],
      ),
      const SizedBox(height: 15),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Estimated delivery time:',
            style: TextStyle(
              color: primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
          Text(
            '15 - 30 mins',
            style: TextStyle(
              color: primaryColor,
              fontSize: 14,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
        ],
      ),
    ],
  );
}
