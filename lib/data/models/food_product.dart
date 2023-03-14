import 'package:salute/data/models/weight.dart';

class FoodProduct {
  final int id;
  final String title;
  final double price;
  final String imageUrl;
  final bool availableDiscount;
  final double? afterDiscount;
  final double? discount;
  final String description;
  Weight? weight;
  List<Addon>? addons;
  List<SubProduct>? subProducts;
  final int categoryId;
  int quantity;
  bool isFav;
  bool isAddedtoCart;
  final ProductType productType;
  FoodProduct({
    required this.productType,
    required this.categoryId,
    this.addons,
    this.subProducts,
    required this.id,
    required this.title,
    required this.price,
    required this.availableDiscount,
    required this.imageUrl,
    required this.description,
    this.isAddedtoCart = false,
    this.quantity = 1,
    this.isFav = false,
    this.discount,
    this.afterDiscount,
  });

  set setAddons(newAddons) {
    addons = newAddons;
  }

  set setSubProducts(newSubProducts) {
    subProducts = newSubProducts;
  }
}

class Addon {
  final int id;
  final int categoryId;
  final String name;
  final String imageUrl;
  final double price;
  const Addon({
    required this.categoryId,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

class SubProduct {
  final int id;
  final int categoryId;
  final String name;
  final String imageUrl;
  final double price;
  const SubProduct({
    required this.categoryId,
    required this.id,
    required this.imageUrl,
    required this.name,
    required this.price,
  });
}

enum ProductType {
  catering,
  takeaway,
}
