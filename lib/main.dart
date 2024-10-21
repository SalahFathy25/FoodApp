import 'package:flutter/material.dart';
import 'package:food_app/app/screens/home/home_screen.dart';
import 'package:food_app/app/screens/login&signup%20screens/login_screen.dart';
import 'package:food_app/app/screens/login&signup%20screens/pick_image_screen.dart';
import 'package:food_app/main_page.dart';

// import 'app/screens/details_screen/details_screen.dart';
import 'app/screens/login&signup screens/signup_screen.dart';
import 'app/screens/splash_screens/circle_animated_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/login': (context) => LoginScreen(),
        '/register': (context) => SignupScreen(),
        '/signup': (context) => SignupScreen(),
        '/home': (context) => const HomeScreen(),
        '/pickImage': (context) => const PickImageScreen(),
      },
      debugShowCheckedModeBanner: false,
      home: const CircleAnimatedScreen(),
      // home: LoginScreen(),
      // home: SignupScreen(),
      // home: const PickImageScreen(),
      // home: const HomeScreen(),
      // home: MainPage(),
    );
  }
}
