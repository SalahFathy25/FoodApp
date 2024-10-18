import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/utils/colors.dart';

Widget alertDialogWidget(BuildContext context) {
  return AlertDialog(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    backgroundColor: Colors.white,
    title: Column(
      children: [
        const Icon(
          Icons.check_circle,
          size: 100,
          color: primaryColor,
        ),
        const SizedBox(height: 10),
        Text(
          'Success !',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: primaryColor,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
      ],
    ),
    content: Text(
      'Your payment was successful.\nA receipt for this purchase has been sent to your email.',
      textAlign: TextAlign.center,
      style: TextStyle(
        fontSize: 15,
        color: const Color(0xff808080),
        fontFamily: GoogleFonts.roboto().fontFamily,
      ),
    ),
    actions: [
      Center(
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            fixedSize: const Size(150, 50),
          ),
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushNamedAndRemoveUntil(
              context,
              '/home',
              (route) => false,
            );
          },
          child: Text(
            'Go Back',
            style: TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.w600,
              fontFamily: GoogleFonts.roboto().fontFamily,
            ),
          ),
        ),
      ),
    ],
  );
}
