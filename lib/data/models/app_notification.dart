class AppNotification {
  bool isSeen;
  final String title;
  final NotifcationCategory category;
  final String? imageUrl;
  final int id;
  AppNotification({
    required this.id,
    required this.title,
    required this.isSeen,
    this.imageUrl,
    required this.category,
  });
}

enum NotifcationCategory {
  discount,
  announcement,
}
