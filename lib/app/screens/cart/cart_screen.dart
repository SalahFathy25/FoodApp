import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:food_app/app/screens/favourite/widgets/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({super.key});

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  Uint8List? profileImage;
  Future<void> loadProfileImage() async {
    final prefs = await SharedPreferences.getInstance();
    String? base64Image = prefs.getString('profileImage');
    if (base64Image != null) {
      setState(
        () {
          profileImage = base64Decode(base64Image);
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          appBar(image: profileImage),
        ],
      ),
    );
  }
}
