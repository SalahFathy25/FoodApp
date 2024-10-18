import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class PortionWidget extends StatefulWidget {
  const PortionWidget({super.key});

  @override
  State<PortionWidget> createState() => _PortionWidgetState();
}

class _PortionWidgetState extends State<PortionWidget> {
  int counter = 1;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Text(
          'Portion: ',
          style: TextStyle(
            color: Color(0xff878787),
            fontSize: 18,
          ),
        ),
        Container(
          width: 100,
          color: Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              InkWell(
                onTap: () {
                  setState(
                    () {
                      if (counter > 0) {
                        counter--;
                      }
                    },
                  );
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primaryColor,
                  ),
                  child: const Icon(
                    CupertinoIcons.minus,
                    color: Colors.white,
                  ),
                ),
              ),
              Text(
                '$counter',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              InkWell(
                onTap: () {
                  setState(
                    () {
                      counter++;
                    },
                  );
                },
                child: Container(
                  width: 35,
                  height: 35,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: primaryColor,
                  ),
                  child: const Icon(
                    CupertinoIcons.add,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
