class TrackingModel {
  final bool isActived;
  final String time;
  final String title;
  final String subTitle;
  final int step;
  const TrackingModel({
    required this.isActived,
    required this.subTitle,
    this.time = "",
    required this.title,
    required this.step,
  });
}
