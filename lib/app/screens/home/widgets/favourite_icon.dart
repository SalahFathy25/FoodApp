import 'package:flutter/material.dart';

import '../../../../core/utils/colors.dart';

class FavouriteIcon extends StatefulWidget {
  final bool isFavourite;
  final VoidCallback onToggleFavourite;

  const FavouriteIcon({
    super.key,
    required this.isFavourite,
    required this.onToggleFavourite,
  });

  @override
  State<FavouriteIcon> createState() => _FavouriteIconState();
}

class _FavouriteIconState extends State<FavouriteIcon>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      
    );

    _scaleAnimation = Tween<double>(begin: 1.0, end: 1.5).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOutSine),
    );

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleFavourite() {
    widget.onToggleFavourite();
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _scaleAnimation,
      builder: (context, child) {
        return Transform.scale(
          scale: _scaleAnimation.value,
          child: IconButton(
            onPressed: _toggleFavourite,
            icon: Icon(
              widget.isFavourite
                  ? Icons.favorite
                  : Icons.favorite_border_rounded,
            ),
            color: widget.isFavourite ? primaryColor : Colors.black,
          ),
        );
      },
    );
  }
}
