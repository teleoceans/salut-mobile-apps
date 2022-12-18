import 'package:flutter/material.dart';
import 'package:salute/components/shopping_components/list_view_item.dart';

import '../../models/food_product.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key});
  static List<FoodProduct> cardProducts = [
    FoodProduct(
      title: "Product title",
      imageUrl: 'assets/images/food_product_image.jpeg',
      price: 150,
      availableDiscount: true,
    ),
    FoodProduct(
      title: "Product title",
      imageUrl: 'assets/images/food_product_image.jpeg',
      price: 150,
      availableDiscount: true,
    ),
    FoodProduct(
      title: "Product title",
      imageUrl: 'assets/images/food_product_image.jpeg',
      price: 150,
      availableDiscount: true,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListViewItem(
        product: cardProducts[index],
        forFav: false,
      ),
      itemCount: cardProducts.length,
    );
  }
}
