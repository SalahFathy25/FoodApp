import 'dart:io';
import 'dart:typed_data';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:food_app/app/screens/login&signup%20screens/signup_screen.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PickImageScreen extends StatefulWidget {
  const PickImageScreen({super.key});

  @override
  State<PickImageScreen> createState() => _PickImageScreenState();
}

class _PickImageScreenState extends State<PickImageScreen> {
  Uint8List? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: primaryColor,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10),
            child: GestureDetector(
              onTap: () {
                if (_image != null) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SignupScreen(),
                    ),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Please select an image'),
                      duration: Duration(seconds: 2),
                    ),
                  );
                }
              },
              child: const Icon(
                Icons.check,
                color: primaryColor,
                size: 25,
              ),
            ),
          )
        ],
        title: const Text(
          'Profile Photo',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60,
              backgroundColor: Colors.grey,
              backgroundImage: _image != null ? MemoryImage(_image!) : null,
              child: _image == null
                  ? const Icon(
                      Icons.person,
                      size: 60,
                      color: Colors.white,
                    )
                  : null,
            ),
            const SizedBox(height: 20),
            const Text(
              'A photo of you',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Please make sure your photo clearly shows your face.',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                pickImageFromCamera();
              },
              child: const Text(
                'Take photo',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: primaryColor,
                minimumSize: const Size(double.infinity, 50),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              onPressed: () {
                // showImagePickerOption(context);
                pickImageFromGallery();
              },
              child: const Text(
                'Choose from gallery',
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ],
        ),
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
        _image = File(returnImage.path).readAsBytesSync();
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
        _image = File(returnImage.path).readAsBytesSync();
      },
    );
  }
}

// void showImagePickerOption(BuildContext context) {
//   showModalBottomSheet(
//     backgroundColor: Colors.blue[100],
//     context: context,
//     builder: (builder) {
//       return Padding(
//         padding: const EdgeInsets.all(18.0),
//         child: SizedBox(
//           width: MediaQuery.of(context).size.width,
//           height: MediaQuery.of(context).size.height / 4.5,
//           child: Row(
//             children: [
//               Expanded(
//                 child: InkWell(
//                   onTap: () {
//                     _pickImageFromGallery();
//                   },
//                   child: const SizedBox(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.image, size: 70),
//                         Text("Gallery"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Expanded(
//                 child: InkWell(
//                   onTap: () {
//                     _pickImageFromCamera();
//                   },
//                   child: const SizedBox(
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.center,
//                       children: [
//                         Icon(Icons.camera_alt, size: 70),
//                         Text("Camera"),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }

// class ImageDisplayScreen extends StatelessWidget {
//   final Uint8List? image;

//   const ImageDisplayScreen({Key? key, this.image}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Image Display Screen'),
//       ),
//       body: Center(
//         child: image != null
//             ? Image.memory(image!)
//             : Image.asset('assets/images/no_image.jpg'),
//       ),
//     );
//   }
// }
