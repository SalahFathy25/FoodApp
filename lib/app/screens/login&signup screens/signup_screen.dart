// ignore_for_file: use_build_context_synchronously

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/cache/shared_helper.dart';
import 'package:food_app/app/screens/login&signup%20screens/widgets/password.dart';
import 'package:food_app/app/screens/login&signup%20screens/widgets/text_form_widget.dart';

import '../../../core/utils/colors.dart';
import '../../../core/utils/variables.dart';
import 'pick_image_screen.dart';
import 'widgets/bottom_buttons_widget.dart';
import 'widgets/logos_widget.dart';
import 'widgets/or_text_widget.dart';

class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
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
                    const SizedBox(height: 10),
                    const Text.rich(
                      TextSpan(
                        text: 'Create',
                        style: TextStyle(
                          color: primaryColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 35,
                        ),
                        children: [
                          TextSpan(
                            text: ' an Account',
                            style: TextStyle(
                              color: Color(0xff333E34),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 10),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        children: [
                          Expanded(
                            child: textFormWidget(
                              textController: firstNameController,
                              hintText: 'First Name',
                              icon: CupertinoIcons.person,
                              obscureText: false,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your first name';
                                }
                                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                  return 'First name must contain only letters';
                                }
                                if (value.length < 2) {
                                  return 'First name must be at least 2 characters long';
                                }
                                return null;
                              },
                            ),
                          ),
                          const SizedBox(width: 10),
                          Expanded(
                            child: textFormWidget(
                              textController: lastNameController,
                              hintText: 'Last Name',
                              icon: CupertinoIcons.person,
                              obscureText: false,
                              keyboardType: TextInputType.name,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your last name';
                                }
                                if (!RegExp(r'^[a-zA-Z]+$').hasMatch(value)) {
                                  return 'Last name must contain only letters';
                                }
                                if (value.length < 2) {
                                  return 'Last name must be at least 2 characters long';
                                }
                                return null;
                              },
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
                    const SizedBox(height: 10),
                    Password(textController: password1Controller),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PickImageScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        minimumSize: Size(150, 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text(
                        'Upload Image',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () async {
                        if (formKey.currentState!.validate() != false) {
                          await SharedHelper().saveUserData(context, formKey);
                        }
                      },
                      child: bottomButtonWidget(context, 'Sign Up'),
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
                          'Already have an Account?',
                          style: TextStyle(color: smallTextColor),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.pushNamed(
                              context,
                              '/login',
                            );
                          },
                          child: const Text(
                            ' Login',
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
