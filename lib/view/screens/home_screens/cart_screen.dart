import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/data/providers/products_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/shopping_components/cart_list_view.dart';
import 'package:salute/view/screens/profile_screens/addresses_screen.dart';
import 'package:salute/view/screens/registration_screens/sign_in_screen.dart';
import 'package:salute/view/screens/shopping_screens/checkout_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../data/providers/addresses_provider.dart';
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
        child: Provider.of<ProductsProvider>(context).cartItems.isEmpty
            ? SingleChildScrollView(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset("assets/images/thank_you.png"),
                      UnderPictureBody(
                      body:"${AppLocalizations.of(context)!.cart_not2}",
                      title: "${AppLocalizations.of(context)!.cart_not1}",
                    ),
                    const SizedBox(
                      height: 32,
                    ),
                    DefaultButton(
                      text: "${AppLocalizations.of(context)!.checkout}",
                      onTap: () {},
                      backgroundColor: Colors.grey,
                      borderColor: Colors.grey,
                    ),
                  ],
                ),
            )
            : Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: CartListView(
                      cartItems:
                          Provider.of<ProductsProvider>(context).cartItems,
                    ),
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.total}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            "${Provider.of<ProductsProvider>(context,
                                listen: false)
                                .calculateFinalPrice()
                                .toStringAsFixed(2)} LE",
                            style: const TextStyle(
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
                        children: [
                          Text(
                            "${AppLocalizations.of(context)!.address}",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 16,
                            ),
                          ),
                          Provider.of<AddressesProvider>(context, listen: false).currentAddress == null
                              ? GestureDetector(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, AddressesScreen.routeName);
                                  },
                                  child: Text(
                                    Provider.of<AddressesProvider>(context)
                                                .currentAddress ==
                                            null
                                        ? "${AppLocalizations.of(context)!.add_addresses}"
                                        : "${Provider.of<AddressesProvider>(context).currentAddress!.buildNumber}, ${Provider.of<AddressesProvider>(context).currentAddress!.streetName}",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : Text(
                                  "${Provider.of<AddressesProvider>(context, listen: false).currentAddress!.buildNumber}, ${Provider.of<AddressesProvider>(context, listen: false).currentAddress!.streetName}",
                                  style: const TextStyle(
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
                        text: "${AppLocalizations.of(context)!.checkout}",
                        onTap: () {
                          if (Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty) {
                            Navigator.pushNamed(
                                context, SignInScreen.routeName);
                          } else {
                            Navigator.pushNamed(
                                context, CheckoutScreen.routeName);
                          }

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
