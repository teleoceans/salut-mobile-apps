class OrderStatus {
  final int statusId;
  final String dateString;
  final int id;
  // final int order_number;
  String? pendingTime;
  String? confirmedTime;
  String? outOfDeliveryTime;
  String? deliveredTime;
  OrderStatus({
    required this.dateString,
    required this.id,
    required this.statusId,
    // required this.order_number,
    this.pendingTime,
    this.outOfDeliveryTime,
    this.confirmedTime,
    this.deliveredTime,
  });
}
