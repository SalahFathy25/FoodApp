import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class SpiceChoiceWidget extends StatefulWidget {
  const SpiceChoiceWidget({super.key});

  @override
  State<SpiceChoiceWidget> createState() => _SpiceChoiceWidgetState();
}

class _SpiceChoiceWidgetState extends State<SpiceChoiceWidget> {
  bool clicked = false;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          const Text(
            'Spice: ',
            style: TextStyle(
              color: Color(0xff878787),
              fontSize: 18,
            ),
          ),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  clicked = !clicked;
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor:
                  !clicked ? const Color(0xffF3F4F6) : const Color(0xff1BD41B),
              foregroundColor:
                  !clicked ? const Color(0xff6A6A6A) : Colors.white,
              minimumSize: Size(MediaQuery.sizeOf(context).width / 2.7, 40),
            ),
            child: const Text('Mild'),
          ),
          const SizedBox(width: 8),
          ElevatedButton(
            onPressed: () {
              setState(
                () {
                  clicked = !clicked;
                },
              );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: clicked ? const Color(0xffF3F4F6) : primaryColor,
              foregroundColor: clicked ? const Color(0xff6A6A6A) : Colors.white,
              minimumSize: Size(MediaQuery.sizeOf(context).width / 2.7, 40),
            ),
            child: const Text('Hot'),
          ),
        ],
      ),
    );
  }
}
