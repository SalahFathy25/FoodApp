import 'package:flutter/material.dart';
import 'package:food_app/app/screens/home/components/item.dart';
import 'package:food_app/app/screens/home/widgets/appbar.dart';
import 'package:food_app/app/screens/home/widgets/categories_part.dart';
import 'package:food_app/app/screens/home/widgets/home_item.dart';
import 'package:food_app/app/screens/home/widgets/search_area.dart';

import 'lists/home_item_data.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List filteredItems = [];
  String selectedCategory = 'All';
  List<Item> filteredButtonsItems = homeItemData;

  @override
  void initState() {
    super.initState();
    filteredItems = homeItemData;
  }

  void filterItems(String query) {
    setState(
      () {
        if (query.isEmpty) {
          filteredItems = homeItemData;
        } else {
          filteredItems = homeItemData
              .where((item) =>
                  item.title.toLowerCase().startsWith(query.toLowerCase()))
              .toList();
        }
      },
    );
  }

  void filterButtonsItems(String category) {
    setState(
      () {
        selectedCategory = category;
        if (category == 'All') {
          filteredItems = homeItemData;
        } else {
          filteredItems = homeItemData
              .where((item) => item.title.contains(category))
              .toList();
        }
      },
    );
  }

  void toggleFavouriteStatus(Item item) {
    setState(
      () {
        item.isFavourite = !item.isFavourite;
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: ListView(
            children: [
              appBar(),
              SearchArea(onSearchChanged: filterItems),
              CategoriesPart(
                onCategorySelected: filterButtonsItems,
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: double.infinity,
                height: 500,
                child: GridView.builder(
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.525,
                  ),
                  itemBuilder: (context, index) {
                    final item = filteredItems[index];
                    return homeItemWidget(context, item, toggleFavouriteStatus);
                  },
                  itemCount: filteredItems.length,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
