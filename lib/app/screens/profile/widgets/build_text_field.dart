import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

Widget buildTextField({
  required String label,
  required TextEditingController controller,
  bool readOnly = false,
  IconButton? suffixIcon,
}) {
  return TextFormField(
    controller: controller,
    style: const TextStyle(color: Colors.black),
    decoration: InputDecoration(
      suffixIcon: suffixIcon,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
      ),
      focusedBorder: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        borderSide: BorderSide(color: primaryColor, width: 2),
      ),
      filled: true,
      fillColor: Colors.white,
      labelText: label,
      labelStyle: const TextStyle(color: Colors.grey, fontSize: 20),
    ),
    readOnly: readOnly,
  );
}
