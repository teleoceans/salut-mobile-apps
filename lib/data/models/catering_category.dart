import 'package:salute/data/models/weight.dart';

class CateringProduct {
  final int index;
  final String title;
  final double price;
  final String imageUrl;
  final String ingredients;
  Weight? weight;

  final List<String>? types;
  final String? description;
  CateringProduct({
    required this.index,
    required this.title,
    required this.price,
    required this.imageUrl,
    required this.ingredients,
    this.description,
    this.types,
    this.weight,
  });

  set setWeight(Weight newWeight) {
    weight = newWeight;
  }
}
