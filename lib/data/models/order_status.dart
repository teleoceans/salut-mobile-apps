class OrderStatus {
  final int statusId;
  final String dateString;
  final int id;
  String? pendingTime;
  String? confirmedTime;
  String? outOfDeliveryTime;
  String? deliveredTime;
  OrderStatus({
    required this.dateString,
    required this.id,
    required this.statusId,
    this.pendingTime,
    this.outOfDeliveryTime,
    this.confirmedTime,
    this.deliveredTime,
  });
}
