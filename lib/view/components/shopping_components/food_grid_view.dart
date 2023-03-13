import 'package:flutter/material.dart';
import 'package:salute/view/components/shopping_components/product_item.dart';

import '../../../data/models/food_product.dart';

class FoodGridView extends StatelessWidget {
  const FoodGridView({super.key, required this.food, required this.isCatering});
  final bool isCatering;
  final List<FoodProduct> food;
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: food.length,
      itemBuilder: (context, index) => FoodProductItem(
        food: food[index],
        isCatering: isCatering,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 15,
      ),
    );
  }
}
