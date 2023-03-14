import 'dart:convert';

import 'package:salute/data/providers/auth_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class SharedPreferencesHelper {
  static var data;
  static void saveUser(User user) async {
    Map<String, dynamic> userMap = {
      "name": user.name,
      "email": user.email,
      "gender": user.gender,
      "phone_number": user.phoneNumber,
      "password": user.password,
      "access_token": user.authToken,
      "birthday": user.birthday,
    };
    final String encoded = json.encode(userMap);
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('encoded_user', encoded);
  }

  static Future<String> getSavedUser() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedUser = prefs.getString('encoded_user');
    if (encodedUser == null) return '';

    final user = json.decode(encodedUser);
    AuthProvider().setUser(user);
    //log(user['name']);
    return user['access_token'] ?? "";
  }

  static Future<String> getUserName() async {
    final prefs = await SharedPreferences.getInstance();
    final encodedUser = prefs.getString('encoded_user');
    if (encodedUser == null) return '';

    final user = json.decode(encodedUser);
    data=user;
    return user['name'] ?? "";
  }

  static Future<void> removeUser() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.clear();
  }

  static Future<void> saveLastOrderId(int id) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setInt('last_order_id', id);
  }

  static Future<int> getLastOrderId() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    final lastOrderId = preferences.getInt('last_order_id');
    return lastOrderId ?? -1;
  }

  
}
