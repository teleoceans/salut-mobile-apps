import 'package:flutter/material.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:salute/view/components/shopping_components/list_view_item.dart';

class CartListView extends StatelessWidget {
  const CartListView({super.key, required this.cartItems});
  final List<FoodProduct> cartItems;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) => ListViewItem(
        product: cartItems[index],
        forFav: true,
      ),
      itemCount: cartItems.length,
    );
  }
}
