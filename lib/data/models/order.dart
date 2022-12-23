import 'package:salute/data/models/food_product.dart';

class Order {
  final double totalPrice;
  final List<FoodProduct> orderedFood;
  final double tax;
  final double varTax;
  final double? promo;

  Order({
    required this.totalPrice,
    required this.orderedFood,
    required this.tax,
    required this.varTax,
    required this.promo,
  });
}
