import 'package:clothesapp/models/Item.dart';
import 'package:clothesapp/widgets/clothing_card.dart';
import 'package:flutter/material.dart';

class ClothingGrid extends StatelessWidget {
  final List<ClothingItem> clothingItems;
  const ClothingGrid({super.key, required this.clothingItems});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      padding: const EdgeInsets.all(8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 8,
        mainAxisSpacing: 8,
      ),
      itemCount: clothingItems.length,
      itemBuilder: (context, index) {
        final item = clothingItems[index];
        return ClothingCard(item: item);
      },
    );
  }
}
