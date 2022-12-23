import 'package:flutter/material.dart';
import 'package:salute/data/models/food_product.dart';

class OrderReceiptContainer extends StatelessWidget {
  const OrderReceiptContainer({
    super.key,
    required this.foodProducts,
  });
  final List<FoodProduct> foodProducts;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.1),
            blurRadius: 2,
            spreadRadius: 3,
          )
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Order Details",
            style: TextStyle(
              color: Color.fromARGB(255, 63, 63, 63),
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(
            height: 16,
          ),
          OrderList(foodProducts: foodProducts),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Delivery",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              Text(
                "20.00 LE",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Tax",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              Text(
                "5.00 LE",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Var",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              Text(
                "5.00 LE",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Promo",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
              Text(
                "-20.00 LE",
                style: TextStyle(
                  color: Colors.black54,
                  fontSize: 16,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

class OrderList extends StatelessWidget {
  const OrderList({super.key, required this.foodProducts});
  final List<FoodProduct> foodProducts;
  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: List.generate(
        foodProducts.length,
        (index) => Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "x${foodProducts[index].quantity} ${foodProducts[index].title}",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
                Text(
                  "${foodProducts[index].price} LE",
                  style: const TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 8,
            ),
          ],
        ),
      ),
    );
  }
}
