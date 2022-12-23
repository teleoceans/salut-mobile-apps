import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/ui_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/screens/shopping_screens/track_order_screen.dart';

import '../../../constants.dart';
import '../../components/profile_components/address_container.dart';
import '../../components/shopping_components/order_reciept_container.dart';
import '../../components/shopping_components/payment_method_container.dart';

class OrderDetailsScreen extends StatelessWidget {
  const OrderDetailsScreen({
    super.key,
  });
  static const String routeName = "OrderDetailsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: kPrimaryColor,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Checkout",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ListView(
                children: [
                  const SizedBox(
                    height: 16,
                  ),
                  const AddressContainer(
                    margin: 16,
                    address: "2464 Royal Ln. Mesa, New Jersey 45463",
                    suffixText: "Change",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const PaymentMethodsContainer(),
                  const SizedBox(
                    height: 16,
                  ),
                  OrderReceiptContainer(
                    foodProducts: Provider.of<UiProvider>(context).cartItems,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "By placing on order you agree to our ",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Terms",
                                style: TextStyle(
                                  color: kTermsAndConditionsColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            const Text(
                              " and ",
                              style: TextStyle(color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: const Text(
                                "Conditions",
                                style: TextStyle(
                                  color: kTermsAndConditionsColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Total",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "${Provider.of<UiProvider>(context, listen: false).totalPrice} LE",
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 28,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: DefaultButton(
                      text: "Edit Order",
                      backgroundColor: Colors.transparent,
                      textColor: kPrimaryColor,
                      onTap: () {
                        int count = 0;
                        Navigator.popUntil(context, (_) => count++ >= 2);
                      },
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            DefaultButton(
              text: "Place Order",
              onTap: () {
                Navigator.pushReplacementNamed(
                  context,
                  TrackOrderScreen.routeName,
                );
              },
              margin: 16,
            ),
            const SizedBox(
              height: 16,
            )
          ],
        ),
      ),
    );
  }
}
