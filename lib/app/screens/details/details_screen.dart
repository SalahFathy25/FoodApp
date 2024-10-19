import 'package:flutter/material.dart';
import 'package:food_app/core/utils/colors.dart';

import '../cart/cart_screen.dart';
import '../home/components/item.dart';
import 'widgets/portion_widget.dart';
import 'widgets/spice_choice_widget.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key, required this.item});
  final Item? item;

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
            iconSize: 30,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: ListView(
          children: [
            Hero(
              tag: widget.item!.id,
              transitionOnUserGestures: true,
              child: Image.asset(
                widget.item!.detailsImage,
                width: MediaQuery.of(context).size.width,
                height: 300,
              ),
            ),
            Text(
              widget.item!.detailsTitle,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 28,
                color: bigTextColor,
              ),
            ),
            Row(
              children: [
                const Icon(Icons.star, color: Color(0xffFF9633)),
                const SizedBox(width: 2),
                Text(
                  '${widget.item!.rate}',
                  style: const TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 17,
                    color: Color(0xff808080),
                  ),
                ),
              ],
            ),
            Text(
              widget.item!.longDescription,
              style: const TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 16,
                color: Color(0xff6A6A6A),
              ),
            ),
            const SpiceChoiceWidget(),
            const PortionWidget(),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  clipBehavior: Clip.none,
                  width: 110,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: primaryColor,
                  ),
                  child: Center(
                    child: Text(
                      '\$${widget.item!.price}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartScreen(),
                    ),
                  ),
                  child: Container(
                    width: 180,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: bigTextColor,
                    ),
                    child: const Center(
                      child: Text(
                        'Add to cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
