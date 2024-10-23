import 'dart:convert';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:food_app/app/screens/favourite/widgets/appbar.dart';
import 'package:food_app/app/screens/home/widgets/appbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../home/components/item.dart';
import '../home/lists/home_item_data.dart';
import '../home/widgets/home_item.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {
  Uint8List? profileImage;
  void toggleFavouriteStatus(Item item) {
    setState(
      () {
        item.isFavourite = true;
      },
    );
  }

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
          SizedBox(
            width: double.infinity,
            height: 500,
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.525,
              ),
              itemBuilder: (context, index) {
                return homeItemWidget(
                    context, homeItemData[index], toggleFavouriteStatus);
              },
              itemCount: homeItemData.length,
            ),
          ),
        ],
      ),
    );
  }
}
