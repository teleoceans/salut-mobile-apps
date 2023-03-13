import 'package:flutter/material.dart';
import 'package:salute/data/models/food_product.dart';

class CurrentItemProvider with ChangeNotifier {
  double _extrasPrices = 0;
  FoodProduct? _food;
  set setCurrentFoodProduct(FoodProduct currentFood) {
    _food = currentFood;
  }

  FoodProduct get food {
    return _food!;
  }

  void incrementQuantity(FoodProduct food) {
    food.quantity++;
    notifyListeners();
  }

  void decrementQuantity(FoodProduct food) {
    if (food.quantity > 1) {
      food.quantity--;
      notifyListeners();
    }
  }

  double getFinalPrice() {
    return (_food!.price * _food!.quantity) + getExtraPrices();
  }

  void addToAddons(Addon addon) {
    if (_currentAddons.contains(addon)) {
      _extrasPrices -= addon.price;
      _currentAddons.remove(addon);
    } else {
      _currentAddons.add(addon);
    }
    notifyListeners();
  }

  void addToSubProducts(SubProduct subProduct) {
    if (_currentSubProducts.contains(subProduct)) {
      _extrasPrices -= subProduct.price;

      _currentSubProducts.remove(subProduct);
    } else {
      _currentSubProducts.add(subProduct);
    }

    notifyListeners();
  }

  final List<Addon> _currentAddons = [];
  final List<SubProduct> _currentSubProducts = [];

  double getExtraPrices() {
    if (_currentAddons.isNotEmpty) {
      for (var addon in _currentAddons) {
        _extrasPrices += addon.price;
      }
    }
    if (_currentSubProducts.isNotEmpty) {
      for (var subProduct in _currentSubProducts) {
        _extrasPrices += subProduct.price;
      }
    }
    return _extrasPrices;
  }

  void clearCurrentProduct() {
    _food = null;
    _currentAddons.clear();
    _currentSubProducts.clear();
    _extrasPrices = 0;
    notifyListeners();
  }
}
