import 'package:flutter/material.dart';
import 'package:salute/components/default_button.dart';
import 'package:salute/components/shopping_components/product_details_checkbox.dart';
import 'package:salute/components/shopping_components/quantity_widget.dart';
import 'package:salute/constants.dart';
import 'package:salute/models/food_product.dart';

import '../../components/default_form_field.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({
    super.key,
  });
  static const String routeName = "ProductDetailsScreen";

  static FoodProduct foodProduct = FoodProduct(
    title: "Chicken Wings",
    imageUrl: "assets/images/food_product_image.jpeg",
    price: 300,
    availableDiscount: true,
    afterDiscount: 150,
    discount: 50,
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: kPrimaryColor,
                    size: 30,
                  ),
                  onPressed: () => Navigator.pop(context),
                ),
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.all(16),
                    child: Material(
                      elevation: 1,
                      borderRadius: BorderRadius.circular(16),
                      child: DefaultFormField(
                        borderRadius: 16,
                        unFocusColor: Colors.black.withOpacity(0.1),
                        focusColor: Colors.black.withOpacity(0.2),
                        textColor: Colors.black,
                        keyboardType: TextInputType.text,
                        prefixIcon: const Icon(
                          Icons.search,
                          size: 28,
                          color: kPrimaryColor,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  Image.asset('assets/images/product_detail_screen.png'),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Text(
                          "Pizza Pepproni",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                        Text(
                          "100.00",
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                  QuantityWidget(
                    object: foodProduct,
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      "Description",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 24,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.Lorem ipsum dolor sit amet, consectetur adipiscing elit. Purus aenean amet massa sed at iaculis.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  const SizeChooseWidget(),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: Text(
                      "Extras:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ExtrasCheckBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ExtrasCheckBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ExtrasCheckBox(),
                  const Padding(
                    padding: EdgeInsets.only(left: 16.0, right: 16, top: 16),
                    child: Text(
                      "Dipping sauce:",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const ExtrasCheckBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ExtrasCheckBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ExtrasCheckBox(),
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
                  const ExtrasCheckBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ExtrasCheckBox(),
                  const SizedBox(
                    height: 12,
                  ),
                  const ExtrasCheckBox(),
                ],
              ),
            ),
            const SizedBox(
              height: 18,
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
              height: 12,
            ),
          ],
        ),
      ),
    );
  }
}
