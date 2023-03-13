import 'dart:convert';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salute/data/models/address.dart';

class AddressesProvider with ChangeNotifier {
  static const String domainName = "https://admin.salutme.com/api/";

  static List<Address> _addresses = [];
  List<Address> get addresses {
    return _addresses;
  }

  Future<void> addAddress({
    required String token,
    required Area area,
    required String streetName,
    required BuildingType buildingType,
    required String floorNumber,
    required String apartmentNumber,
    required String addressName,
    required String buildingNumber,
    required String nearbyLandmark,
  }) async {
    try {
      Uri url = Uri.parse("https://admin.salutme.com/api/users/address/add");
      log(token);
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
        body: json.encode({
          "city": area.id,
          "state": 2,
          "street_name": streetName,
          "bulding_type": buildingType.buildingType,
          "bulding_number": buildingNumber,
          "floor_number": floorNumber,
          "apartment_number": apartmentNumber,
          "address_name": addressName,
          "landmark_nearby": nearbyLandmark,
        }),
      );
      if (response.statusCode == 200) {
        Map<String, dynamic> data = json.decode(response.body);
        //log(response.body);
        _addresses.add(
          Address(
            id: data["id"],
            area: area,
            addressName: addressName,
            apartmentNumber: apartmentNumber,
            buildNumber: buildingNumber,
            floorNumber: floorNumber,
            buildingType: buildingType,
            nearbyLandmark: nearbyLandmark,
            streetName: streetName,
          ),
        );
        if (_addresses.length == 1) changeCurrent = _addresses[0].id;
        notifyListeners();
      } else {
        throw response.body;
      }
    } catch (error) {
      rethrow;
    }
    notifyListeners();
  }

  bool _isCalled = false;

  bool get isCalled {
    return _isCalled;
  }

  set setIsCalled(bool value) {
    _isCalled = value;
    notifyListeners();
  }

  Future<void> fetchAddress(String token) async {
    try {
      Uri url = Uri.parse("https://admin.salutme.com/api/users/address/all");
      var response = await http.get(url, headers: {
        "Authorization": "Bearer $token",
      });
      var data = json.decode(response.body);
      if (response.statusCode == 200 && data != []) {
        List<Address> tmp = [];
        for (var address in data) {
          tmp.add(
            Address(
              id: address['id'],
              area: Area(
                  id: address["city"]["id"], areaName: address["city"]["info"]),
              addressName: address["address_name"] ?? "",
              apartmentNumber: address["apartment_number"] ?? "",
              buildNumber: address["apartment_number"] ?? "",
              floorNumber: address["floor_number"] ?? "",
              buildingType: BuildingType(
                  buildingType: address["bulding_type"] ?? "", id: -1),
              nearbyLandmark: address["landmark_nearby"] ?? "",
              streetName: address["street_name"] ?? "",
            ),
          );
        }
        _addresses = tmp;
        if (_addresses.isNotEmpty) {
          changeCurrent = _addresses[0].id;
        }

        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> updateAddress({
    required int id,
    required String token,
    required Area area,
    required String streetName,
    required BuildingType buildingType,
    required String floorNumber,
    required String apartmentNumber,
    required String addressName,
    required String buildingNumber,
    required String nearbyLandmark,
  }) async {
    try {
      log(token);
      Uri url =
          Uri.parse('https://admin.salutme.com/api/users/address/update/1');
      var response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          "Authorization": "Bearer $token",
        },
        body: json.encode({
          "city": 3,
          "state": 2,
          "street_name": "asda sda s",
          "bulding_type": "a sdas dasd as",
          "bulding_number": "2",
          "floor_number": "as da sda sda",
          "apartment_number": "a sdas das ",
          "address_name": "nudasad asdsd asd asd asdll",
          "landmark_nearby": "a sda sda sdasda sdasdasda"
        }),
      );
      log(response.body.substring(0, 10));
      log(id.toString());
      if (response.statusCode == 200) {
        _addresses.removeWhere((element) => element.id == id);
        _addresses.add(
          Address(
            id: id,
            area: area,
            addressName: addressName,
            apartmentNumber: apartmentNumber,
            buildNumber: buildingNumber,
            floorNumber: floorNumber,
            buildingType: buildingType,
            nearbyLandmark: nearbyLandmark,
            streetName: streetName,
          ),
        );
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  Address? _currentAddress = _addresses.isEmpty ? null : _addresses[0];
  set changeCurrent(int id) {
    _currentAddress = _addresses.firstWhere((element) => id == element.id);
    notifyListeners();
  }

  Address? get currentAddress {
    return _currentAddress;
  }

  Future<void> deleteAddress({required int id, required String token}) async {
    try {
      Uri url =
          Uri.parse('https://admin.salutme.com/api/users/address/delete/$id');

      http.Response response = await http.get(url, headers: {
        "Authorization": "Bearer $token",
      });
      log(response.body);
      _addresses.removeWhere((element) => element.id == id);
      if (_addresses.isEmpty) {
        _currentAddress = null;
      } else {
        _currentAddress = _addresses[0];
      }
      notifyListeners();
    } catch (error) {
      rethrow;
    }

    notifyListeners();
  }

  Address? findAddressById(int id) {
    return _addresses.firstWhere(
      (element) => element.id == id,
    );
  }
}
