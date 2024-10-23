// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:food_app/main_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../core/utils/functions.dart';
import '../../core/utils/variables.dart';

class SharedHelper {
  Future<String> saveUserData(
      BuildContext context, GlobalKey<FormState> formKey) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setString('firstName', firstNameController.text);
    prefs.setString('lastName', lastNameController.text);
    prefs.setString('email', emailController.text);
    prefs.setString('password', passwordController.text);

    if (formKey.currentState!.validate()) {
      if (context.mounted) {
        signupSuccess(context);
      }
    }

    return emailController.text +
        passwordController.text +
        firstNameController.text +
        lastNameController.text;
  }

  Future<String> loadUserData(BuildContext context) async {
    final prefs = await SharedPreferences.getInstance();
    String? savedEmail = prefs.getString('email');
    String? savedPassword = prefs.getString('password');
    String? savedName =
        '${prefs.getString('firstName') ?? ''} ${prefs.getString('lastName') ?? ''}';

    if (savedEmail == emailController.text &&
        savedPassword == passwordController.text) {
      if (context.mounted) {
        Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => MainPage()),
          (route) => false,
        );
      }
      welcome(context, savedName);
    } else if (savedEmail!.isEmpty || savedPassword!.isEmpty) {
      if (context.mounted) {
        emptyFieldsWarning(context);
      }
    } else {
      if (context.mounted) {
        loginFailed(context);
      }
    }
    return savedName.trim();
  }

  Future<bool> saveTheme(String theme) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('theme', theme);
    return true;
  }

  Future<String?> getTheme() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? theme = prefs.getString('theme');
    return theme;
  }
}
