import 'dart:convert';
import 'dart:developer';
import 'package:intl/intl.dart';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/data/models/address.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:salute/data/models/order_status.dart';

class ProductsProvider with ChangeNotifier {
  List<FoodProduct> allProducts = [];
  List<FoodProduct> SearchFood=[];
  List<FoodProduct> get takeawayProducts {
    return allProducts
        .where((element) => element.productType == ProductType.takeaway)
        .toList();
  }

  List<FoodProduct> get cateringProduct {
    return allProducts
        .where((element) => element.productType == ProductType.catering)
        .toList();
  }

  Future<void> getTakeawayProductsFromApi() async {
    try {
      Uri url = Uri.parse("https://admin.salutme.com/api/products");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);
        List<FoodProduct> temp = [];
        int index = 0;
        for (Map<String, dynamic> product in data['takeaway']) {
          temp.add(
            FoodProduct(
              productType: ProductType.takeaway,
              addons: [],
              subProducts: [],
              categoryId: int.parse(product["category_id"]),
              id: product['id'],
              title: product['name'],
              price: double.parse(product['old_price']),
              discount: (1 -
                      double.parse(product["price"]) /
                          double.parse(product['old_price'])) *
                  100,
              afterDiscount: double.parse(product["price"]),
              availableDiscount: double.parse(product["price"]) !=
                  double.parse(product['old_price']),
              imageUrl: product["category"]['image'] != ""
                  ? product["category"]['image']
                  : 'assets/images/food_product_image.jpeg',
              description: product['description'],
            ),
          );
          if (product.containsKey('addons')) {
            for (var addon in product["addons"]) {
              temp[index].addons!.add(
                    Addon(
                      categoryId: int.parse(addon["category_id"]),
                      id: addon['id'],
                      imageUrl: addon["image_url"],
                      name: addon["name"],
                      price: double.parse(addon["price"]),
                    ),
                  );
            }
          }
          if (product.containsKey("subproducts")) {
            for (var subProduct in product["subproducts"]) {
              temp[index].subProducts!.add(
                    SubProduct(
                      id: subProduct['id'],
                      name: subProduct['name'],
                      price: double.parse(subProduct['price']),
                      imageUrl: subProduct["image_url"],
                      categoryId: int.parse(subProduct["category_id"]),
                    ),
                  );
            }
          }
          index++;
        }
        for (Map<String, dynamic> product in data['catering']) {
          temp.add(
            FoodProduct(
              productType: ProductType.catering,
              addons: [],
              subProducts: [],
              categoryId: int.parse(product["category_id"]),
              id: product['id'],
              title: product['name'],
              price: double.parse(product['old_price']),
              discount: (1 -
                      double.parse(product["price"]) /
                          double.parse(product['old_price'])) *
                  100,
              afterDiscount: double.parse(product["price"]),
              availableDiscount: double.parse(product["price"]) !=
                  double.parse(product['old_price']),
              imageUrl: product["category"]['image'] != ""
                  ? product["category"]['image']
                  : 'assets/images/food_product_image.jpeg',
              description: product['description'],
            ),
          );
          if (product.containsKey('addons')) {
            for (var addon in product["addons"]) {
              temp[index].addons!.add(
                    Addon(
                      categoryId: int.parse(addon["category_id"]),
                      id: addon['id'],
                      imageUrl: addon["image_url"],
                      name: addon["name"],
                      price: double.parse(addon["price"]),
                    ),
                  );
            }
          }
          if (product.containsKey("subproducts")) {
            for (var subProduct in product["subproducts"]) {
              temp[index].subProducts!.add(
                    SubProduct(
                      id: subProduct['id'],
                      name: subProduct['name'],
                      price: double.parse(subProduct['price']),
                      imageUrl: subProduct["image_url"],
                      categoryId: int.parse(subProduct["category_id"]),
                    ),
                  );
            }
          }
          index++;
        }

        allProducts = temp;
        notifyListeners();
      } else {
        throw "error";
      }
    } catch (error) {
      log(error.toString());
      rethrow;
    }
  }

  bool _isCateringCalled = false;
  bool get isCateringCalled {
    return _isCateringCalled;
  }

  set setIsCateringCalled(bool value) {
    _isCateringCalled = value;
    notifyListeners();
  }

  Future<void> getCateringProducts() async {
    try {
      Uri url = Uri.parse("https://admin.salutme.com/api/products");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body);

        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  FoodProduct findProductById(int id) {
    return allProducts.firstWhere((element) => element.id == id);
  }

  FoodProduct findCateringProductById(int id) {
    return cateringProduct.firstWhere((element) => element.id == id);
  }

  bool _isCalled = false;
  bool get isCalled {
    return _isCalled;
  }

  set setIsCalled(bool value) {
    _isCalled = value;
  }

  void toggleFavStatus(FoodProduct foodProduct) {
    int index = allProducts.indexOf(foodProduct);
    allProducts[index].isFav = !allProducts[index].isFav;
    notifyListeners();
  }

  void toggleCartStatus(FoodProduct foodProduct) {
    int index = allProducts.indexOf(foodProduct);
    allProducts[index].isAddedtoCart = !allProducts[index].isAddedtoCart;
    notifyListeners();
  }

  List<FoodProduct> get favoriteFood {
    return allProducts.where((element) => element.isFav == true).toList();
  }

  List<FoodProduct> get cartItems {
    return allProducts
        .where((element) => element.isAddedtoCart == true)
        .toList();
  }

  ClearCartItems() {
    for(int i=0;i<allProducts.length;i++){
      print("index :${i} -- name${allProducts[i].title}");
      allProducts[i].isAddedtoCart=false;
    }
  }

  double calculateFinalPrice() {
    double finalPrice = 0.0;
    for (var item in cartItems) {
      double itemPrice = 0.0;
      itemPrice += item.price;
      for (var addon in item.addons!) {
        itemPrice += addon.price;
      }
      for (var subProducts in item.subProducts!) {
        itemPrice += subProducts.price;
      }
      itemPrice *= item.quantity;
      finalPrice += itemPrice;
    }
    return finalPrice;
  }

  String _deliveryMethod = "deliver now";

  bool _wantsNow = true;

  void toggleDeliverStatus() {
    _wantsNow = !_wantsNow;
    notifyListeners();
  }

  bool get wantsNow {
    return _wantsNow;
  }

  set setDeliveryMethond(String value) {
    _deliveryMethod = value;
    notifyListeners();
  }

  void addDateAndTime(String dateOrTime) {
    _deliveryMethod += dateOrTime;
    notifyListeners();
  }

  int lastOrderId = -1;
  Future<void> createOrder(
      {required String token, required Address address, String? notes}) async {
    Uri url = Uri.parse('https://admin.salutme.com/api/orders/create');
    try {
      List<Map<String, dynamic>> orderItems = [];
      for (var product in cartItems) {
        orderItems.add({
          "product_id": product.id,
          "quantity": product.quantity,
          "title": product.title,
          "type": "product"
        });
        for (var addon in product.addons!) {
          orderItems.add({
            "product_id": addon.id,
            "quantity": product.quantity,
            "title": addon.name,
            "type": "addons",
          });
          for (var subProduct in product.subProducts!) {
            orderItems.add({
              "product_id": subProduct.id,
              "quantity": product.quantity,
              "title": subProduct.name,
              "type": "sub_product",
            });
          }
        }
      }
      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
        body: jsonEncode(
          {
            "category_id": 2,
            "status_id": 1,
            "location_id": address.area.id,
            "address":
                "${address.floorNumber} floor, ${address.buildNumber}, ${address.streetName}, ${address.area.areaName}. near ${address.nearbyLandmark}",
            "delivery_method": _deliveryMethod,
            "notes": notes ?? "No Notes",
            "products": orderItems,
          },
        ),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      lastOrderId = data["Catering"]["id"];
      await SharedPreferencesHelper.saveLastOrderId(lastOrderId);

      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  bool _isLastOrderCalled = false;
  set setIsLastOrderCalled(bool value) {
    _isLastOrderCalled = value;
  }

  bool get isLastOrderCalled {
    return _isLastOrderCalled;
  }

  OrderStatus? _orderStatus;

  OrderStatus? get orderStatus {
    return _orderStatus;
  }

  String formatDate(String dateString) {
    return DateFormat.yMMMMd().format(DateTime.parse(dateString));
  }

  String formateTime(String dateString) {
    return DateFormat.jm().format(DateTime.parse(dateString));
  }

  Future<void> getLastOrder({int? id, required token}) async {
    {
      try {
        if (id != -1 && id != null) {
          Uri url = Uri.parse("https://admin.salutme.com/api/orders/show/$id");

          var response =
              await http.get(url, headers: {"Authorization": "Bearer $token"});
          if (response.statusCode == 200) {
            Map<String, dynamic> data = jsonDecode(response.body)["Orders"];
            _orderStatus = OrderStatus(
                dateString: formatDate(data["created_at"]),
                id: id,
                statusId: data["status"]["id"],
                pendingTime: formateTime(data["status"]["created_at"]));
          }
          if (_orderStatus!.pendingTime!.length == 7) {
            _orderStatus!.pendingTime = '0${_orderStatus!.pendingTime}';
          }
        }
      } catch (error) {
        rethrow;
      }
    }
  }

  void changeWeight() {}
  Future<void> CancelOrder({required String token, required id}) async {
    Uri url = Uri.parse('https://admin.salutme.com/api/orders/cancel-order/${id}');
    try {
      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer $token",
          "Content-Type": "application/json",
        },
      );
      if(response.statusCode==200){
        print(response.body);
      }
      else{
        print("error");
        print(response.body);
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }
  }

  Future SearchItem({required String text}) async {
    var data;
    Uri url = Uri.parse('https://admin.salutme.com/api/products/search');
    try {
      var response = await http.post(
        url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: {
          "name":"${text}",
        }
      );
      if(response.statusCode==200){
        print(response.body);
         data = jsonDecode(response.body);
      }
      else{
        print("error");
        print(response.body);
      }
      notifyListeners();
      return data;
    } catch (error) {
      rethrow;
    }
  }
}
