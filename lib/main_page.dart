import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_app/app/screens/cart/cart_screen.dart';
import 'package:food_app/app/screens/favourite/favourite_screen.dart';
import 'package:food_app/app/screens/home/home_screen.dart';
import 'package:food_app/core/utils/colors.dart';
import 'package:simple_floating_bottom_nav_bar/floating_bottom_nav_bar.dart';
import 'package:simple_floating_bottom_nav_bar/floating_item.dart';

import 'app/screens/profile/profile_screen.dart';

// ignore: must_be_immutable
class MainPage extends StatelessWidget {
  MainPage({super.key});

  List<FloatingBottomNavItem> bottomNavItems = const [
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.home_outlined),
      activeIcon: Icon(CupertinoIcons.home),
      label: "Home",
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(CupertinoIcons.heart),
      activeIcon: Icon(CupertinoIcons.heart_fill),
      label: "Search",
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(CupertinoIcons.cart_fill),
      activeIcon: Icon(CupertinoIcons.cart),
      label: "Add",
    ),
    FloatingBottomNavItem(
      inactiveIcon: Icon(Icons.person_outline),
      activeIcon: Icon(Icons.person),
      label: "Profile",
    ),
  ];

  List<Widget> pages =  [
    const HomeScreen(),
    const FavouriteScreen(),
    const CartScreen(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return FloatingBottomNavBar(
      pages: pages,
      items: bottomNavItems,
      initialPageIndex: 0,
      backgroundColor: primaryColor,
      bottomPadding: 2,
      elevation: 0,
      radius: 50,
      width: 320,
      height: 68,
    );
  }
}
