import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salute/data/models/category.dart';

class CategoryProvider with ChangeNotifier {
  List<Category> _takeawayCategories = [];

  List<Category> get takeawayCategories {
    return _takeawayCategories;
  }

  Future<void> getTakeawayCategoriesFromApi() async {
    try {
      Uri url = Uri.parse("https://admin.salutme.com/api/category/products");
      http.Response response = await http.get(url);
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data["status"] == 'success') {
        List<Category> temp = [];
        for (var category in data["data"]) {
          temp.add(
            Category(
              title: category['name'],
              imageUrl: category['url_image'],
            ),
          );
        }
        _takeawayCategories = temp;
        notifyListeners();
      } else {
        throw data["massage"];
      }
    } catch (error) {
      rethrow;
    }
  }
}
