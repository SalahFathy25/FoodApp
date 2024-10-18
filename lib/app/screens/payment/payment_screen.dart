import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/screens/payment/widgets/order_summary_widget.dart';
import 'package:food_app/app/screens/payment/widgets/payment_methods_widget.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import 'widgets/alert_dialog_widget.dart';

class PaymentScreen extends StatelessWidget {
  const PaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView(
          children: [
            orderSummaryWidget(),
            const SizedBox(height: 40),
            const PaymentMethodsWidget(),
           
            
            const SizedBox(height: 40),
            Row(
              children: [
                const Spacer(),
                Column(
                  children: [
                    Text(
                      'Total price',
                      style: TextStyle(
                        color: const Color(0xff808080),
                        fontSize: 16,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    RichText(
                      text: const TextSpan(
                        children: [
                          TextSpan(
                            text: '\$',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                              fontSize: 30,
                            ),
                          ),
                          TextSpan(
                            text: '16.48',
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              color: Colors.black,
                              fontSize: 30,
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                const Spacer(flex: 2),
                ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return alertDialogWidget(context);
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 12,
                    ),
                  ),
                  child: Text(
                    'Pay Now',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  
}
