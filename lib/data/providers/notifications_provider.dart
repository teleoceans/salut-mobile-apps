import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:salute/data/models/app_notification.dart';

class NotificationProvider with ChangeNotifier {
  List<AppNotification> _notifications = [];
  List<AppNotification> get allNotifications {
    return _notifications;
  }

  bool _isCalled = false;

  bool get isCalled {
    return _isCalled;
  }

  set setIsCalled(bool value) {
    _isCalled = value;
    notifyListeners();
  }

  List<AppNotification> get discountNotification {
    return _notifications
        .where((element) => element.category == NotifcationCategory.discount)
        .toList();
  }

  List<AppNotification> get announcementNotifications {
    return _notifications
        .where(
            (element) => element.category == NotifcationCategory.announcement)
        .toList();
  }

  Future<void> fetchNotifications() async {
    Uri url = Uri.parse("https://admin.salutme.com/api/notification/all");

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = jsonDecode(response.body)["data"];
        List<AppNotification> tmp = [];
        for (var notification in data) {
          tmp.add(
            AppNotification(
              id: 1,
              title: notification["title"],
              isSeen: false,
              category: notification["type"] == "discount"
                  ? NotifcationCategory.discount
                  : NotifcationCategory.announcement,
            ),
          );
        }
        _notifications = tmp;
        notifyListeners();
      }
    } catch (error) {
      rethrow;
    }
  }

  void seeAllNotificaitons() {
    for (var notification in _notifications) {
      notification.isSeen = true;
    }
    notifyListeners();
  }
}
