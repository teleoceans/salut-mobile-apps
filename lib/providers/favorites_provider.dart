import 'package:flutter/material.dart';
import 'package:salute/models/food_product.dart';

class FavoritesProvider with ChangeNotifier {
  final List<FoodProduct> _favoriteFood = [
    FoodProduct(
      title: "Product title",
      imageUrl: 'assets/images/food_product_image.jpeg',
      price: 150,
      availableDiscount: true,
      isFav: true,
    ),
    FoodProduct(
      title: "Product title",
      imageUrl: 'assets/images/food_product_image.jpeg',
      price: 150,
      availableDiscount: true,
      isFav: true,
    ),
    FoodProduct(
      title: "Product title",
      imageUrl: 'assets/images/food_product_image.jpeg',
      price: 150,
      availableDiscount: true,
      isFav: true,
    ),
  ];

  List<FoodProduct> get favoriteFood {
    return _favoriteFood;
  }
}
