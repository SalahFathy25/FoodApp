import 'package:flutter/material.dart';
import 'package:food_app/app/screens/details/details_screen.dart';

import '../../../../core/utils/colors.dart';
import '../components/item.dart';
import 'favourite_icon.dart';

Widget homeItemWidget(BuildContext context, Item item) {
  return InkWell(
    onTap: () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DetailsScreen(item: item),
        ),
      );
    },
    child: Container(
      padding: const EdgeInsets.symmetric(horizontal: 7),
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 5),
      width: 155,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Center(
            child: Image.asset(
              item.image,
              width: 120,
              height: 150,
            ),
          ),
          Text(
            item.title,
            style: const TextStyle(
              color: bigTextColor,
              fontWeight: FontWeight.w500,
              fontSize: 19,
            ),
          ),
          const Spacer(),
          Text(
            item.description,
            style: const TextStyle(
              color: bigTextColor,
              fontWeight: FontWeight.w400,
              fontSize: 15,
            ),
          ),
          const Spacer(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  const Icon(
                    Icons.star,
                    color: Color(0xffFF9633),
                  ),
                  const SizedBox(width: 2),
                  Text(
                    '${item.rate}',
                    style: const TextStyle(
                      color: bigTextColor,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              const Spacer(flex: 10),
              const FavouriteIcon(),
              const Spacer(),
            ],
          )
        ],
      ),
    ),
  );
}
