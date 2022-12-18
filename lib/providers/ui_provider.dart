import 'package:flutter/material.dart';

class UiProvider with ChangeNotifier {
  int _currentIndex = 0;
  int get currentIndex {
    return _currentIndex;
  }

  set setCurrentIndex(int index) {
    _currentIndex = index;
    notifyListeners();
  }
}
