import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'widgets/build_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  Uint8List? profileImage;
  String userName = 'Guest';
  String deliveryAddress = "10th of Ramadan";
  String? email;
  TextEditingController userNameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController deliveryAddressController = TextEditingController();

  bool isUserNameEditable = false;
  bool isEmailEditable = false;
  bool isDeliveryAddressEditable = false;

  @override
  void initState() {
    super.initState();
    loadProfileData();
    deliveryAddressController.text = deliveryAddress;
  }

  Future<void> loadProfileData() async {
    final prefs = await SharedPreferences.getInstance();

    String? base64Image = prefs.getString('profileImage');
    if (base64Image != null) {
      setState(() {
        profileImage = base64Decode(base64Image);
      });
    }

    String? firstName = prefs.getString('firstName');
    String? lastName = prefs.getString('lastName');
    String? emailPref = prefs.getString('email');

    setState(() {
      userName = (firstName != null && lastName != null)
          ? '$firstName $lastName'
          : 'Guest';
      userNameController.text = userName;
      email = emailPref;
      emailController.text = emailPref ?? '';
    });
  }

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    deliveryAddressController.dispose();
    super.dispose();
  }

  void toggleUserNameEditable() {
    setState(
      () {
        isUserNameEditable = !isUserNameEditable;
      },
    );
  }

  void toggleEmailEditable() {
    setState(
      () {
        isEmailEditable = !isEmailEditable;
      },
    );
  }

  void toggleDeliveryAddressEditable() {
    setState(
      () {
        isDeliveryAddressEditable = !isDeliveryAddressEditable;
      },
    );
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
                buildTextField(
                  label: 'Name',
                  controller: userNameController,
                  readOnly: !isUserNameEditable,
                  suffixIcon: IconButton(
                    onPressed: toggleUserNameEditable,
                    icon: Icon(
                      isUserNameEditable ? Icons.check : Icons.edit,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                buildTextField(
                  label: 'Email',
                  controller: emailController,
                  readOnly: !isEmailEditable,
                  suffixIcon: IconButton(
                    onPressed: toggleEmailEditable,
                    icon: Icon(
                      isEmailEditable ? Icons.check : Icons.edit,
                      color: primaryColor,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                buildTextField(
                  label: 'Delivery Address',
                  controller: deliveryAddressController,
                  readOnly: !isDeliveryAddressEditable,
                  suffixIcon: IconButton(
                    onPressed: toggleDeliveryAddressEditable,
                    icon: Icon(
                      isDeliveryAddressEditable ? Icons.check : Icons.edit,
                      color: primaryColor,
                    ),
                  ),
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
                    : const AssetImage('assets/images/no_image.webp')
                        as ImageProvider,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
