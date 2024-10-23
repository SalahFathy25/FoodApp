import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_app/app/cubit/app_cubit.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../login&signup screens/login_screen.dart';
import 'widgets/build_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool switched = true;
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
    var bloc = context.read<AppCubit>();
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
                const SizedBox(height: 90),
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
                const SizedBox(height: 20),
                Row(
                  children: [
                    Text(
                      'appearance',
                      style: TextStyle(
                        color: const Color(0xff808080),
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                        fontFamily: GoogleFonts.roboto().fontFamily,
                      ),
                    ),
                    const Spacer(),
                    BlocBuilder<AppCubit, AppState>(
                      builder: (context, state) {
                        var cubit = BlocProvider.of<AppCubit>(context);
                        return Switch(
                          value: bloc.theme == "dark",
                          activeColor: primaryColor,
                          inactiveTrackColor: Colors.black,
                          activeThumbImage: const AssetImage(
                            'assets/images/sun-transformed.png',
                          ),
                          inactiveThumbImage: const AssetImage(
                            'assets/images/moon-transformed.png',
                          ),
                          onChanged: (value) {
                            cubit.changeTheme(value ? "dark" : "light");
                          },
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                GestureDetector(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (builder) => AlertDialog(
                        title: const Text(
                          'Are you sure you want to log out?',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        actions: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: primaryColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pushAndRemoveUntil(
                                    MaterialPageRoute(
                                      builder: (context) => LoginScreen(),
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: const Text(
                                  'Log out',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  },
                  child: Container(
                    margin: const EdgeInsets.symmetric(vertical: 5),
                    width: MediaQuery.of(context).size.width,
                    height: 60,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(color: primaryColor, width: 2),
                    ),
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Log out',
                          style: TextStyle(
                            color: primaryColor,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(width: 10),
                        Icon(Icons.logout, color: primaryColor, size: 30),
                      ],
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
            child: Center(
              child: Stack(
                children: [
                  CircleAvatar(
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
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      icon: const Icon(
                        Icons.camera_alt,
                        color: primaryColor,
                      ),
                      onPressed: () {
                        showImagePickerOption(context);
                      },
                      iconSize: 30,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;

    String base64Image = base64Encode(File(returnImage.path).readAsBytesSync());

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', base64Image);

    setState(
      () {
        profileImage = File(returnImage.path).readAsBytesSync();
      },
    );
  }

  Future<void> pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;

    String base64Image = base64Encode(File(returnImage.path).readAsBytesSync());

    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('profileImage', base64Image);

    setState(
      () {
        profileImage = File(returnImage.path).readAsBytesSync();
      },
    );
  }

  void showImagePickerOption(BuildContext context) {
    showModalBottomSheet(
      backgroundColor: Colors.white,
      context: context,
      builder: (builder) {
        return Padding(
          padding: const EdgeInsets.all(18.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height / 5.5,
            child: Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () {
                      pickImageFromGallery();
                    },
                    child: const SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.image, size: 70),
                          Text("Gallery"),
                        ],
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: InkWell(
                    onTap: () {
                      pickImageFromCamera();
                    },
                    child: const SizedBox(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.camera_alt, size: 70),
                          Text("Camera"),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
