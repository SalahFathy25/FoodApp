import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class PaymentMethodsWidget extends StatefulWidget {
  const PaymentMethodsWidget({super.key});

  @override
  PaymentMethodsWidgetState createState() => PaymentMethodsWidgetState();
}

class PaymentMethodsWidgetState extends State<PaymentMethodsWidget> {
  bool selected = false;
  int? cardSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Payment methods',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w600,
            fontFamily: GoogleFonts.poppins().fontFamily,
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: cardSelected == 0
              ? bigTextColor.withOpacity(0.9)
              : const Color(0xffF3F4F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/master_card.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Credit card',
                          style: TextStyle(
                            color:
                                cardSelected == 0 ? Colors.white : Colors.black,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '5105 **** **** 0505',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 160, 160, 160),
                            fontSize: 14,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Radio<int?>(
                  value: 0,
                  groupValue: cardSelected,
                  onChanged: (int? value) {
                    setState(
                      () {
                        cardSelected = value;
                      },
                    );
                  },
                  activeColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Card(
          color: cardSelected == 1
              ? bigTextColor.withOpacity(0.9)
              : const Color(0xffF3F4F6),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          elevation: 20,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Image.asset(
                      'assets/images/visa.png',
                      width: 80,
                      height: 80,
                    ),
                    const SizedBox(width: 16),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Debit card',
                          style: TextStyle(
                            color:
                                cardSelected == 1 ? Colors.black : Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          '3566 **** **** 0505',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 160, 160, 160),
                            fontSize: 14,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Radio<int?>(
                  value: 1,
                  groupValue: cardSelected,
                  onChanged: (int? value) {
                    setState(
                      () {
                        cardSelected = value;
                      },
                    );
                  },
                  activeColor: Colors.white,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            CupertinoCheckbox(
              value: selected,
              onChanged: (bool? value) {
                setState(
                  () {
                    selected = !selected;
                  },
                );
              },
              activeColor: primaryColor,
            ),
            Text(
              'Save card details for future payments',
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
                color: const Color(0xff808080),
                fontFamily: GoogleFonts.roboto().fontFamily,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
