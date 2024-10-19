import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:food_app/app/cache/shared_helper.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: FutureBuilder<String>(
        future: SharedHelper().loadUserData(context),
        builder: (context, snapshot) {
          String savedName = snapshot.data!;
          return Stack(
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
                        initialValue: savedName,
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
                      )
                    ],
                  )),
              Positioned(
                top: 90,
                left: 0,
                right: 0,
                child: CircleAvatar(
                  radius: 63,
                  backgroundColor: primaryColor,
                  child: CircleAvatar(
                    radius: 60,
                    backgroundImage: Image.asset('assets/images/profile.png',
                            fit: BoxFit.cover)
                        .image,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
