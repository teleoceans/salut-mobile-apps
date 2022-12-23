class AppNotification {
  final bool isSeen;
  final String title;
  final NotifcationCategory category;
  final String? imageUrl;

  const AppNotification({
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
