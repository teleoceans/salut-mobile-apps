import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/shopping_components/cart_list_view.dart';
import 'package:salute/view/screens/shopping_screens/checkout_screen.dart';

import '../../../data/providers/ui_provider.dart';
import '../../components/registration_components/under_picture_body.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});
  static const String routeName = "CartScreen";
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16.0,
        ),
        child: Provider.of<UiProvider>(context).cartItems.isEmpty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/thank_you.png"),
                  const UnderPictureBody(
                    body:
                        "Seems you haven’t added anything to your cart yet!  Start ordering and add items.",
                    title: "Your cart is empty",
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  DefaultButton(
                    text: "Checkout",
                    onTap: () {},
                    backgroundColor: Colors.grey,
                    borderColor: Colors.grey,
                  ),
                ],
              )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CartListView(
                      cartItems: Provider.of<UiProvider>(context).cartItems,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Cart Total",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "300.00",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
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
                            "Delivery address:",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "2464 Royal Ln. Mesa,\n New Jersey 45463",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      DefaultButton(
                        text: "Checkout",
                        onTap: () {
                          Provider.of<UiProvider>(context, listen: false)
                              .caluclateTotalPrice();
                          Navigator.pushNamed(
                              context, CheckoutScreen.routeName);
                        },
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                    ],
                  )
                ],
              ),
      ),
    );
  }
}
