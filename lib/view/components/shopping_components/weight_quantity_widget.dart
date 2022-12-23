import 'package:flutter/material.dart';
import 'package:salute/data/models/catering_category.dart';
import 'package:salute/data/models/weight.dart';

import '../../../constants.dart';

class WeightQuantityWidget extends StatefulWidget {
  const WeightQuantityWidget({
    super.key,
    required this.mass,
    required this.cateringProduct,
  });
  final double mass;
  final CateringProduct cateringProduct;
  @override
  State<WeightQuantityWidget> createState() => _WeightQuantityWidget();
}

class _WeightQuantityWidget extends State<WeightQuantityWidget> {
  int quantity = 0;

  @override
  Widget build(BuildContext context) {
    widget.cateringProduct.weight = Weight(
      mass: widget.mass,
      quantity: quantity,
    );
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.cateringProduct.weight!.mass} Kg",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Container(
            width: 32,
            height: 40,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              child: const Text(
                "-",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  if (quantity > 0) {
                    quantity--;
                  }
                });
              },
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 8),
            width: 40,
            height: 40,
            decoration: BoxDecoration(
              border: Border.all(),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Center(
              child: Text(
                "${widget.cateringProduct.weight!.quantity}",
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          Container(
            width: 32,
            height: 40,
            decoration: BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: TextButton(
              child: const Text(
                "+",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              onPressed: () {
                setState(() {
                  quantity++;
                });
              },
            ),
          ),
        ],
      ),
    );
  }
}
