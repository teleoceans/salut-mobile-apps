import 'package:flutter/material.dart';
import 'package:salute/data/models/food_product.dart';

import '../models/app_notification.dart';

class UiProvider with ChangeNotifier {
  final List<FoodProduct> _food = [
    FoodProduct(
      id: 0,
      title: "Chicken Wings",
      imageUrl: "assets/images/food_product_image.jpeg",
      price: 300,
      availableDiscount: true,
      afterDiscount: 150,
      discount: 50,
    ),
    FoodProduct(
      id: 1,
      title: "Chicken Wings",
      imageUrl: "assets/images/food_product_image.jpeg",
      price: 300,
      availableDiscount: true,
      afterDiscount: 150,
      discount: 50,
    ),
    FoodProduct(
      id: 2,
      title: "Chicken Wings",
      imageUrl: "assets/images/food_product_image.jpeg",
      price: 300,
      availableDiscount: true,
      afterDiscount: 150,
      discount: 50,
    ),
    FoodProduct(
      id: 3,
      title: "Chicken Wings",
      imageUrl: "assets/images/food_product_image.jpeg",
      price: 300,
      availableDiscount: false,
      afterDiscount: 150,
      discount: 50,
    ),
  ];
  List<FoodProduct> get food {
    return _food;
  }

  FoodProduct findProductById(int id) {
    return _food.firstWhere((element) => element.id == id);
  }

  void toggleFavStatus(FoodProduct foodProduct) {
    int index = food.indexOf(foodProduct);
    _food[index].isFav = !_food[index].isFav;
    notifyListeners();
  }

  void toggleCartStatus(FoodProduct foodProduct) {
    int index = food.indexOf(foodProduct);
    _food[index].isAddedtoCart = !_food[index].isAddedtoCart;
    notifyListeners();
  }

  List<FoodProduct> get favoriteFood {
    return _food.where((element) => element.isFav == true).toList();
  }

  List<FoodProduct> get cartItems {
    return _food.where((element) => element.isAddedtoCart == true).toList();
  }

  bool _deliverNow = true;

  void toggleDeilverNowValue() {
    _deliverNow = !_deliverNow;
    notifyListeners();
  }

  bool get deliverNow {
    return _deliverNow;
  }

  double _totalPrice = 0;

  double get totalPrice {
    return _totalPrice;
  }

  void caluclateTotalPrice() {
    clearPrice();
    for (var product in cartItems) {
      _totalPrice += (product.price * product.quantity);
    }
    _totalPrice = _totalPrice + 5 + 5;
    notifyListeners();
  }

  void clearPrice() {
    _totalPrice = 0;
  }

  final List<AppNotification> _notifications = [
    const AppNotification(
      title: "Get 20.00 EGP off on selected items",
      isSeen: false,
      category: NotifcationCategory.discount,
    ),
    const AppNotification(
      title: "Get 20.00 EGP off on selected items",
      isSeen: false,
      category: NotifcationCategory.discount,
    ),
    const AppNotification(
      title: "We are open in 6th Of October",
      isSeen: false,
      category: NotifcationCategory.announcement,
    ),
    const AppNotification(
      title: "Get 20.00 EGP off on selected items",
      isSeen: true,
      category: NotifcationCategory.discount,
    ),
    const AppNotification(
      title: "We are open in 6th Of October",
      isSeen: true,
      category: NotifcationCategory.announcement,
    ),
  ];

  List<AppNotification> get announcementsNotificationList {
    return _notifications
        .where(
            (element) => element.category == NotifcationCategory.announcement)
        .toList();
  }

  List<AppNotification> get discountsNotificationList {
    return _notifications
        .where((element) => element.category == NotifcationCategory.discount)
        .toList();
  }

  List<AppNotification> get allNotifications {
    return _notifications;
  }
}
