import 'package:flutter/material.dart';
import 'package:salute/data/models/food_product.dart';
import 'package:salute/data/models/weight.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/shopping_components/weight_quantity_widget.dart';

import '../default_button.dart';
import 'addons_list_view.dart';

class CateringTabView extends StatefulWidget {
  const CateringTabView({
    super.key,
    required this.cateringProduct,
  });
  final FoodProduct cateringProduct;

  @override
  State<CateringTabView> createState() => _CateringTabViewState();
}

class _CateringTabViewState extends State<CateringTabView> {
  @override
  void initState() {
    widget.cateringProduct.weight = Weight(mass: 1, quantity: 1);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView(
            children: [
              Image.asset(widget.cateringProduct.imageUrl),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 32),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.cateringProduct.title,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                    Text(
                      "${widget.cateringProduct.price} LE/KG",
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
                  widget.cateringProduct.description,
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
                cateringProduct: widget.cateringProduct,
                mass: 0.25,
              ),
              const SizedBox(
                height: 12,
              ),
              WeightQuantityWidget(
                cateringProduct: widget.cateringProduct,
                mass: 0.5,
              ),
              const SizedBox(
                height: 12,
              ),
              WeightQuantityWidget(
                cateringProduct: widget.cateringProduct,
                mass: 0.75,
              ),
              const SizedBox(
                height: 12,
              ),
              WeightQuantityWidget(
                cateringProduct: widget.cateringProduct,
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
                child: AddonsListView(
                  isAddon: true,
                  items: widget.cateringProduct.addons ?? [],
                ),
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
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
                child: AddonsListView(
                  isAddon: true,
                  items: widget.cateringProduct.subProducts ?? [],
                ),
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
            children: [
              const Text(
                "Add to Cart",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              Text(
                "${widget.cateringProduct.price * widget.cateringProduct.weight!.mass * widget.cateringProduct.weight!.quantity}",
                style: const TextStyle(
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
