import 'package:flutter/material.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/shopping_components/weight_quantity_widget.dart';
import 'package:salute/data/models/catering_category.dart';

import '../default_button.dart';

class CateringTabView extends StatelessWidget {
  const CateringTabView({
    super.key,
    required this.cateringProduct,
  });
  final CateringProduct cateringProduct;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Image.asset(cateringProduct.imageUrl),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      cateringProduct.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "${cateringProduct.price} LE/KG",
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(16.0),
                child: Text(
                  "Ingredients",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  cateringProduct.ingredients,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 0.5,
                color: Colors.black,
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "Weight:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              WeightQuantityWidget(
                cateringProduct: cateringProduct,
                mass: 0.25,
              ),
              const SizedBox(
                height: 12,
              ),
              WeightQuantityWidget(
                cateringProduct: cateringProduct,
                mass: 0.5,
              ),
              const SizedBox(
                height: 12,
              ),
              WeightQuantityWidget(
                cateringProduct: cateringProduct,
                mass: 0.75,
              ),
              const SizedBox(
                height: 12,
              ),
              WeightQuantityWidget(
                cateringProduct: cateringProduct,
                mass: 1,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                child: Text(
                  "Type:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                child: Text(
                  "Beverages:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 12,
              ),
              const SizedBox(
                height: 16,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                child: Text(
                  "Description:",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: DefaultFormField(
                  focusColor: Colors.black,
                  hintText: 'Type Here',
                  borderRadius: 10,
                  keyboardType: TextInputType.text,
                  maxLines: 5,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 16,
        ),
        DefaultButton(
          padding: 16,
          margin: 16,
          text: "Add to Cart",
          onTap: () {},
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Add to Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "160.00 LE",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
      ],
    );
  }
}
