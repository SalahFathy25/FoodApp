import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? profileImage;
  String? userName;
  TextEditingController userNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _loadProfileData();
  }

  Future<void> saveUserName(String name) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('userName', name);
  }

  Future<void> _loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();

    String? base64Image = prefs.getString('profileImage');
    if (base64Image != null) {
      setState(() {
        profileImage = base64Decode(base64Image);
      });
    }

    String? savedName = prefs.getString('userName');
    if (savedName != null) {
      setState(() {
        userName = savedName;
        userNameController.text = savedName;
      });
    }
  }

  @override
  void dispose() {
    userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Stack(
        children: [
          Container(
            margin: const EdgeInsets.only(top: 150),
            padding: const EdgeInsets.symmetric(horizontal: 20),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            decoration: const BoxDecoration(
              color: backgroundPrimaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40),
                topRight: Radius.circular(40),
              ),
            ),
            child: Column(
              children: [
                const SizedBox(height: 70),
                TextFormField(
                  controller: userNameController,
                  style: const TextStyle(color: Colors.black),
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    labelText: 'Name',
                    labelStyle: TextStyle(color: Colors.grey),
                  ),
                  initialValue: userName,
                  onChanged: (newValue) {
                    userName = newValue;
                    saveUserName(newValue);
                  },
                ),
              ],
            ),
          ),
          Positioned(
            top: 90,
            left: 0,
            right: 0,
            child: CircleAvatar(
              radius: 63,
              backgroundColor: primaryColor,
              child: CircleAvatar(
                radius: 60,
                backgroundImage: profileImage != null
                    ? MemoryImage(profileImage!)
                    : const AssetImage('assets/images/no_image.jpg')
                        as ImageProvider,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
