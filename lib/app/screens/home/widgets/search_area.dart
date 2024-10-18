import 'package:flutter/material.dart';

class SearchArea extends StatelessWidget {
  final Function(String) onSearchChanged;

  const SearchArea({super.key, required this.onSearchChanged});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.white,
              ),
              child: TextField(
                onChanged: onSearchChanged,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: BorderSide.none,
                  ),
                  hintText: 'Search',
                  prefixIcon: const Icon(Icons.search),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
