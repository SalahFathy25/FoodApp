import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget textFormWidget({
  required TextEditingController textController,
  required String hintText,
  required IconData icon,
  required bool obscureText,
  required TextInputType keyboardType,
  required String? Function(String?)? validator,
}) {
  return TextFormField(
    validator: validator,
    onSaved: (value) {
      textController.text = value!;
    },
    controller: textController,
    keyboardType: keyboardType,
    decoration: InputDecoration(
      hintText: hintText,
      hintStyle: const TextStyle(color: smallTextColor),
      prefixIcon: Icon(icon),
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide.none,
      ),
      filled: true,
      fillColor: const Color(0xffF7FAF7),
      errorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(color: primaryColor, width: 1),
      ),
      focusedErrorBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(20),
        ),
        borderSide: BorderSide(color: primaryColor, width: 1),
      ),
    ),
  );
}
