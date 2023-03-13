import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/current_product_provider.dart';

import '../../../constants.dart';

class QuantityWidget extends StatefulWidget {
  const QuantityWidget({
    super.key,
    required this.object,
  });
  final dynamic object;
  @override
  State<QuantityWidget> createState() => _QuantityWidgetState();
}

class _QuantityWidgetState extends State<QuantityWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 40,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton(
            child: const Text(
              "-",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            onPressed: () {
              Provider.of<CurrentItemProvider>(context, listen: false)
                  .decrementQuantity(widget.object);
            },
          ),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 8),
          width: 50,
          height: 50,
          decoration: BoxDecoration(
            border: Border.all(),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              Provider.of<CurrentItemProvider>(context, listen: false)
                  .food
                  .quantity
                  .toString(),
              style: const TextStyle(
                color: Colors.black,
                fontSize: 25,
              ),
            ),
          ),
        ),
        Container(
          width: 40,
          height: 50,
          decoration: BoxDecoration(
            color: kPrimaryColor,
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextButton(
            child: const Text(
              "+",
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
              ),
            ),
            onPressed: () {
              Provider.of<CurrentItemProvider>(context, listen: false)
                  .incrementQuantity(widget.object);
            },
          ),
        ),
      ],
    );
  }
}
