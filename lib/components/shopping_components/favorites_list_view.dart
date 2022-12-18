import 'package:flutter/material.dart';
import 'package:salute/components/shopping_components/list_view_item.dart';
import 'package:salute/models/food_product.dart';

class FavoritesListView extends StatelessWidget {
  const FavoritesListView({super.key, required this.favoritesFood});
  final List<FoodProduct> favoritesFood;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        favoritesFood.length,
        (index) => FavoriteItemContainer(
          foodProduct: favoritesFood[index],
        ),
      ),
    );
  }
}

class FavoriteItemContainer extends StatelessWidget {
  const FavoriteItemContainer({super.key, required this.foodProduct});
  final FoodProduct foodProduct;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ListViewItem(
          product: foodProduct,
          forFav: true,
        ),
      ],
    );
  }
}
