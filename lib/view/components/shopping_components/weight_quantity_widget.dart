import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:salute/data/models/weight.dart';
import 'package:salute/view/components/shopping_components/catering_tab_view.dart';

import '../../../constants.dart';

class WeightQuantityWidget extends StatefulWidget {
  const WeightQuantityWidget({
    super.key,
    required this.mass,
    required this.cateringProduct,
  });
  final double mass;
  final FoodProduct cateringProduct;
  @override
  State<WeightQuantityWidget> createState() => _WeightQuantityWidget();
}
double price=0;
class _WeightQuantityWidget extends State<WeightQuantityWidget> {
  int quantity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    price=0;
  }

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
          Text(
            "${price} LE",
            style: const TextStyle(
              color: Colors.black,
              fontSize: 20,
            ),
          ),
          const Spacer(),
          Consumer<PriceModel>(
              builder:(context ,m,c){
                return  Container(
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
                          price=widget.cateringProduct.price * widget.cateringProduct.weight!.mass * quantity;
                          print(price);
                        }
                        m.changeprice(price);
                      });

                    },
                  ),
                );
              }
          ),
          // Container(
          //   width: 32,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     color: kPrimaryColor,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: TextButton(
          //     child: const Text(
          //       "-",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //       ),
          //     ),
          //     onPressed: () {
          //       setState(() {
          //         if (quantity > 0) {
          //           quantity--;
          //           price=widget.cateringProduct.price * widget.cateringProduct.weight!.mass * quantity;
          //           print(price);
          //         }
          //       });
          //     },
          //   ),
          // ),
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
          Consumer<PriceModel>(
              builder:(context ,m,c){
                return  Container(
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
                        price=widget.cateringProduct.price * widget.cateringProduct.weight!.mass * quantity;
                        print(price);
                      });
                      m.changeprice(price);
                    },
                  ),
                );
              }
          ),
          // Container(
          //   width: 32,
          //   height: 40,
          //   decoration: BoxDecoration(
          //     color: kPrimaryColor,
          //     borderRadius: BorderRadius.circular(12),
          //   ),
          //   child: TextButton(
          //     child: const Text(
          //       "+",
          //       style: TextStyle(
          //         color: Colors.white,
          //         fontSize: 20,
          //       ),
          //     ),
          //     onPressed: () {
          //       setState(() {
          //         quantity++;
          //         price=widget.cateringProduct.price * widget.cateringProduct.weight!.mass * quantity;
          //         print(price);
          //       });
          //     },
          //   ),
          // ),
        ],
      ),
    );
  }
}
