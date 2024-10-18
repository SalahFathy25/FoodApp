import 'package:flutter/material.dart';
import 'package:ftoast/ftoast.dart';

emptyFieldsWarning(context) {
  return FToast.toast(
    context,
    msg: 'Oops! Something went wrong!',
    subMsg: "You must fill all Fields!",
    corner: 20.0,
    duration: 2000,
    padding: const EdgeInsets.all(20),
  );
}

signupSuccess(context) {
  return FToast.toast(
    context,
    msg: "signup successfully!",
    subMsg: "you can login now!",
    corner: 20.0,
    duration: 1000,
    padding: const EdgeInsets.all(20),
  );
}

loginFailed(context) {
  return FToast.toast(
    context,
    msg: "login failed!",
    subMsg: "please try again!",
    corner: 20.0,
    duration: 1000,
    padding: const EdgeInsets.all(20),
  );
}

welcome(context, String name) {
  return FToast.toast(
    context,
    msg: "welcome!",
    subMsg: name,
    corner: 20.0,
    duration: 2800,
    padding: const EdgeInsets.all(20),
  );
}
