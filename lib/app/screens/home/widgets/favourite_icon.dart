import 'package:flutter/material.dart';

class FavouriteIcon extends StatefulWidget {
  const FavouriteIcon({super.key});

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon> {
  bool isFavourite = false;
  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        setState(
          () {
            isFavourite = !isFavourite;
          },
        );
      },
      icon: Icon(isFavourite ? Icons.favorite : Icons.favorite_border_rounded),
      color: isFavourite ? Colors.red : Colors.black,
    );
  }
}
