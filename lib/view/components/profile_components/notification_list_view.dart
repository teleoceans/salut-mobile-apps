import 'package:flutter/material.dart';
import 'package:salute/data/models/app_notification.dart';

class NotifcationListView extends StatelessWidget {
  const NotifcationListView({super.key, required this.notifications});
  final List<AppNotification> notifications;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => NotificationContainer(
        notification: notifications[index],
      ),
      itemCount: notifications.length,
      separatorBuilder: (context, index) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 12),
        color: const Color(0xFFDADADA),
        height: 3,
      ),
    );
  }
}

class NotificationContainer extends StatelessWidget {
  const NotificationContainer({super.key, required this.notification});
  final AppNotification notification;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: Row(
        children: [
          if (notification.category == NotifcationCategory.discount)
            Container(
              width: 80,
              height: 80,
              decoration: BoxDecoration(
                color: Colors.grey,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.07),
                    blurRadius: 2,
                    spreadRadius: 2,
                  ),
                ],
              ),
            ),
          const SizedBox(
            width: 16,
          ),
          Expanded(
            child: Text(
              notification.title,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: notification.isSeen
                    ? const Color(0xFF6C6C6C)
                    : Colors.black,
              ),
            ),
          ),
          const SizedBox(
            width: 16,
          ),
          if (!notification.isSeen)
            Container(
              width: 8,
              height: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.black,
              ),
            )
        ],
      ),
    );
  }
}
