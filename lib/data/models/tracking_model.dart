class TrackingModel {
  final bool isActived;
  final String time;
  final String title;
  final String subTitle;
  const TrackingModel({
    required this.isActived,
    required this.subTitle,
    this.time = "",
    required this.title,
  });
}
