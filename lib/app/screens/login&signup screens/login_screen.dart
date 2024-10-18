// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/cache/shared_helper.dart';
import 'package:food_app/app/screens/login&signup%20screens/widgets/logos_widget.dart';
import 'package:food_app/app/screens/login&signup%20screens/widgets/password.dart';
import 'package:food_app/app/screens/login&signup%20screens/widgets/text_form_widget.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/variables.dart';
import 'widgets/bottom_buttons_widget.dart';
import 'widgets/or_text_widget.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Form(
          key: formKey,
          child: ListView(
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/images/red_logo.png',
                      width: MediaQuery.of(context).size.width * 0.75,
                    ),
                    const SizedBox(height: 20),
                    const Text.rich(
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 28,
                        ),
                        children: [
                          TextSpan(
                            text: ' to your Account',
                            style: TextStyle(
                              color: Color(0xff333E34),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    textFormWidget(
                      textController: emailController,
                      hintText: 'Email',
                      icon: CupertinoIcons.envelope,
                      obscureText: false,
                      keyboardType: TextInputType.emailAddress,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your email';
                        }
                        final emailRegex = RegExp(
                            r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
                        if (!emailRegex.hasMatch(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 10),
                    Password(textController: passwordController),
                    InkWell(
                      onTap: () async {
                        if (formKey.currentState!.validate() != false) {
                          formKey.currentState!.save();
                          await SharedHelper().loadUserData(context);
                        }
                      },
                      child: bottomButtonWidget(context, 'Login'),
                    ),
                    const SizedBox(height: 20),
                    orTextWidget(context),
                    const SizedBox(height: 20),
                    logosWidget(),
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          'Don\'t have an account?',
                          style: TextStyle(color: smallTextColor),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(context, '/signup');
                          },
                          child: const Text(
                            ' Sign Up',
                            style: TextStyle(
                              color: primaryColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
