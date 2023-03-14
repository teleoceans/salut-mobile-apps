import 'package:flutter/material.dart';


class ShoppingProvider with ChangeNotifier {




  
  

  

  

  
  int _currentIndex = 0;
  int get currentIndex {
    return _currentIndex;
  }

  set setCurrentIndex(int newValue) {
    _currentIndex = newValue;
    notifyListeners();
  }

  bool _isTrackingOrder = false;
  bool get isTrackingOrder {
    return _isTrackingOrder;
  }

  set setIsTrackingOrder(bool newValue) {
    _isTrackingOrder = newValue;
    notifyListeners();
  }
}
