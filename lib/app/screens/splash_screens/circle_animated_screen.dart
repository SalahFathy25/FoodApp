import 'dart:async';
import 'package:flutter/material.dart';
import 'package:food_app/app/screens/splash_screens/splash_screen.dart';

import '../../../core/utils/colors.dart';

class CircleAnimatedScreen extends StatefulWidget {
  const CircleAnimatedScreen({super.key});

  @override
  State<CircleAnimatedScreen> createState() => _CircleAnimatedScreenState();
}

class _CircleAnimatedScreenState extends State<CircleAnimatedScreen>
    with SingleTickerProviderStateMixin {
  static const double initialBallYPosition = 0;
  static const double ballStep = 15;
  static const double minBallYPosition = -200;
  static const int maxBounces = 3;
  static const double initialWidth = 50;
  static const double initialHeight = 50;
  static const double initialBottomPosition = 500;

  double ballY = initialBallYPosition;
  double widthVal = initialWidth;
  double heightVal = initialHeight;
  double bottomVal = initialBottomPosition;
  bool add = false;
  bool showShadow = false;
  int times = 0;
  bool showPage = false;

  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 1))
          ..addListener(
            () {
              _updateBallPosition();
              setState(() {});
            },
          );
    _controller.repeat();
  }

  void _updateBallPosition() {
    if (add) {
      ballY += ballStep;
    } else {
      ballY -= ballStep;
    }
    if (ballY <= minBallYPosition) {
      times += 1;
      add = true;
      showShadow = true;
    }
    if (ballY >= initialBallYPosition) {
      add = false;
      showShadow = false;
      widthVal += initialWidth;
      heightVal += initialHeight;
      bottomVal -= 200;
    }
    if (times == maxBounces) {
      bottomVal = 0;
      _showHomeScreen();
      _controller.stop();
    }
  }

  void _showHomeScreen() {
    showShadow = false;
    widthVal = MediaQuery.of(context).size.width;
    heightVal = MediaQuery.of(context).size.height;
    Timer(
      const Duration(milliseconds: 650),
      () {
        setState(
          () {
            showPage = true;
          },
        );
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            AnimatedPositioned(
              bottom: bottomVal,
              duration: const Duration(milliseconds: 600),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Transform.translate(
                    offset: Offset(0, ballY),
                    child: AnimatedScale(
                      duration: const Duration(milliseconds: 200),
                      scale: times == maxBounces ? 5 : 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 1000),
                        width: widthVal,
                        height: heightVal,
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                          color: primaryColor,
                          image: DecorationImage(
                            image: AssetImage('assets/images/background.png'),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                  if (showShadow)
                    Container(
                      width: 60,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Colors.black.withOpacity(.2),
                        borderRadius: BorderRadius.circular(100),
                      ),
                    ),
                  if (showPage)
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: const SplashScreen(),
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
