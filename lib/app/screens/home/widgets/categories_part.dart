import 'package:flutter/material.dart';
import '../../../../core/utils/colors.dart';

class CategoriesPart extends StatefulWidget {
  const CategoriesPart({super.key});

  @override
  State<CategoriesPart> createState() => _CategoriesPartState();
}

class _CategoriesPartState extends State<CategoriesPart> {
  String selected = categories[0];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: categories
            .map(
              (category) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                child: ElevatedButton(
                  onPressed: () {
                    setState(() {
                      selected = category;
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: selected == category
                        ? primaryColor
                        : const Color(0xffF3F4F6),
                    foregroundColor:
                        selected == category ? Colors.white : smallTextColor,
                    padding: const EdgeInsets.all(10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    minimumSize:
                        Size(MediaQuery.of(context).size.width / 5, 40),
                  ),
                  child: Text(
                    category,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: selected == category
                          ? FontWeight.w500
                          : FontWeight.w400,
                    ),
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}

List categories = [
  'All',
  'Combos',
  'Sliders',
  'Classic',
];
