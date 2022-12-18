class FoodProduct {
  final String title;
  final double price;
  final String imageUrl;
  final bool availableDiscount;
  final double? afterDiscount;
  final double? discount;
  int quantity;
  bool isFav;
  bool isAddedtoCart;
  FoodProduct({
    required this.title,
    required this.price,
    required this.availableDiscount,
    required this.imageUrl,
    this.isAddedtoCart = false,
    this.quantity = 1,
    this.isFav = false,
    this.discount,
    this.afterDiscount,
  });
}
