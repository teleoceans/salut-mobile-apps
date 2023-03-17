import 'dart:convert';
import 'dart:developer';
import 'package:salute/data/helpers/shared_preferences.dart';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salute/main.dart';

import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  String _gender = "Male";
  set setGender(String value) {
    _gender = value;
    notifyListeners();
  }

  set setUserName(String name) {
    _user.name = name;
  }

  String get authToken {
    return _user.authToken!;
  }

  // String userName(String userName) {
  //   log(userName);
  //   return "guest";
  // }

  String get gender {
    return _gender;
  }

  final User _user = User();
  User get user {
    return _user;
  }

  static const String domainName = "https://admin.salutme.com/api/";
  static const headers = {
    'Accept': "application/json",
    'Content-Type': "application/json"
  };
  Future<void> createUser({
    required String name,
    required String email,
    required String gender,
    required int roleId,
    required String phoneNumber,
    required String birthday,
    required String password,
  }) async {
    Uri url = Uri.parse('${domainName}user/register');
    try {
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "name": name,
            "email": email,
            "gender": gender,
            "role_id": 2,
            "phone_number": phoneNumber,
            "birthday": birthday,
            "password": password,
          },
        ),
      );

      Map<String, dynamic> data = json.decode(response.body);
      log(data.toString());
      if (data["message"] != "User successfully registered") {
        Map<String, dynamic> errors = data['data'];
        if (errors.containsKey("email")) {
          throw errors['email'][0];
        } else if (errors.containsKey("phone_number")) {
          throw errors["phone_number"][0];
        } else {
          throw 'Something went wrong. Please try again later';
        }
      } else {
        SharedPreferencesHelper.saveUser(_user);
        _user.setName = name;
        _user.setEmail = email;
        _user.setPassword = password;
        _user.setGender = gender;
        _user.setbirthday = birthday;
        _user.setPhoneNumber = phoneNumber;
        _user.setAuthToken = data['access_token'];
        SharedPreferencesHelper.saveUser(_user);

        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> login({required String email, required password}) async {
    try {
      Uri url = Uri.parse("${domainName}user/login");
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            "email": email,
            "password": password,
          },
        ),
      );
      Map<String, dynamic> data = jsonDecode(response.body);

      if (response.statusCode == 200) {
        _user.setName = data['data']["name"];
        _user.setEmail = data["data"]["email"];
        _user.setGender = data["data"]["gender"];
        _user.setPhoneNumber = data['data']["phone_number"];
        _user.setAuthToken = data["access_token"];
        _user.setPassword = password;
        _user.birthday = data["data"]["birthday"];
        _user.points = data["data"]["points"];
        SharedPreferencesHelper.saveUser(_user);
        notifyListeners();
      } else {
        throw data['error'];
      }
    } catch (error) {
      rethrow;
    }
  }

  Future<void> sendCodeToUserMailForChangePassword({required String email,}) async {
    try {
      Uri url = Uri.parse("${domainName}password/email");
      var response = await http.post(
        url,
        headers: headers,
        body: json.encode(
          {
            'email': email,
          },
        ),
      );
      Map<String, dynamic> data = jsonDecode(response.body);
      if (data.containsKey('errors')) {
        throw data['message'];
      } else {}
    } catch (error) {
      rethrow;
    }
  }

  bool _isTermsChecked = false;
  set setIsTermsChecked(bool value) {
    _isTermsChecked = value;
    notifyListeners();
  }

  bool get isTermsChecked {
    return _isTermsChecked;
  }

  void setUser(Map<String, dynamic> user) {
    _user.setName = user["name"];
    _user.setEmail = user['email'];
    _user.setGender = user['gender'];
    _user.setPhoneNumber = user['phone_number'];
    _user.setPassword = user['password'];
    _user.setAuthToken = user['access_token'];
    _user.birthday = user['birthday'];

    notifyListeners();
  }

  set setAuthToken(String value) {
    _user.authToken = value;
  }

  String get userName {
    return _user.name!;
  }
  String get AuthToken {
    return _user.authToken!;
  }

  String get emailName {
    return _user.email!;
  }
}
