import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class Password extends StatefulWidget {
  const Password({
    super.key,
    required this.textController,
  });
  final TextEditingController textController;

  @override
  State<Password> createState() => _PasswordState();
}

class _PasswordState extends State<Password> {
  bool isObscure = true;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter your password';
        }
        if (value.length < 8) {
          return 'Password must be at least 8 characters long';
        }
        if (!RegExp(r'[A-Z]').hasMatch(value)) {
          return 'Password must contain at least one uppercase letter';
        }
        if (!RegExp(r'[a-z]').hasMatch(value)) {
          return 'Password must contain at least one lowercase letter';
        }
        if (!RegExp(r'[0-9]').hasMatch(value)) {
          return 'Password must contain at least one number';
        }

        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value)) {
          return 'Password must contain at least one special character';
        }

        return null;
      },
      onSaved: (value) {
        widget.textController.text = value!;
      },
      cursorColor: primaryColor,
      controller: widget.textController,
      obscureText: isObscure,
      keyboardType: TextInputType.visiblePassword,
      decoration: InputDecoration(
        hintText: 'Password',
        hintStyle: const TextStyle(color: smallTextColor),
        prefixIcon: const Icon(CupertinoIcons.lock),
        suffixIcon: IconButton(
          onPressed: () {
            setState(
              () {
                isObscure = !isObscure;
              },
            );
          },
          icon: Icon(
            isObscure == true
                ? CupertinoIcons.eye_fill
                : CupertinoIcons.eye_slash_fill,
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xffF7FAF7),
        errorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          borderSide: BorderSide(color: primaryColor, width: 1),
        ),
      ),
    );
  }
}
