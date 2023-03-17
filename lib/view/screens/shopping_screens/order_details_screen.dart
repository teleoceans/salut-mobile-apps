import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/screens/shopping_screens/track_order_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constants.dart';
import '../../../data/models/address.dart';
import '../../../data/providers/addresses_provider.dart';
import '../../../data/providers/products_provider.dart';
import '../../components/profile_components/address_container.dart';
import '../../components/shopping_components/payment_method_container.dart';

class OrderDetailsScreen extends StatefulWidget {
  const OrderDetailsScreen({
    super.key,
  });
  static const String routeName = "OrderDetailsScreen";

  @override
  State<OrderDetailsScreen> createState() => _OrderDetailsScreenState();
}

class _OrderDetailsScreenState extends State<OrderDetailsScreen> {
  bool isLoading = false;
  bool isSuccess = true;
  void placeOrder() async {
    isSuccess = true;
    setState(() {
      isLoading = true;
    });
    Address currentAddress =
        Provider.of<AddressesProvider>(context, listen: false).currentAddress!;
    String token = await SharedPreferencesHelper.getSavedUser();
    // ignore: use_build_context_synchronously
    await Provider.of<ProductsProvider>(context, listen: false)
        .createOrder(
      token: token,
      address: currentAddress,
    )
        .catchError((error) {
      isSuccess = false;
      print(error.toString());
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Something went wrong. Try again later")),
      );
      setState(() {
        isLoading = false;
      });
    }).then((value) {
      setState(() {
        isLoading = false;
      });
      if (isSuccess) {
        Provider.of<ProductsProvider>(context, listen: false).ClearCartItems();
        Navigator.pushReplacementNamed(
          context,
          TrackOrderScreen.routeName,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: kArrowBack(context),
        title: Text(
          "${AppLocalizations.of(context)!.checkout}",
          style: kAppBarTitleStyle,
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
                  AddressContainer(
                    margin: 16,
                    address:
                        Provider.of<AddressesProvider>(context, listen: false)
                            .currentAddress,
                    suffixText: "${AppLocalizations.of(context)!.change}",
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  const PaymentMethodsContainer(),
                  const SizedBox(
                    height: 16,
                  ),
                  // OrderReceiptContainer(
                  //   foodProducts:
                  //       Provider.of<ShoppingProvider>(context).cartItems,
                  // ),
                  const SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                          Text(
                          "${AppLocalizations.of(context)!.placing_order}",
                          style: TextStyle(color: Colors.black),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child:   Text(
                                "${AppLocalizations.of(context)!.terms}",
                                style: TextStyle(
                                  color: kTermsAndConditionsColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                              Text(
                              "${AppLocalizations.of(context)!.and}",
                              style: TextStyle(color: Colors.black),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child:   Text(
                                "${AppLocalizations.of(context)!.conditions}",
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
            const SizedBox(
              height: 16,
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
                          Text(
                          "${AppLocalizations.of(context)!.totalt}",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 23,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Text(
                          "${Provider.of<ProductsProvider>(context, listen: false).calculateFinalPrice()} LE",
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
                      text: "${AppLocalizations.of(context)!.edit_order}",
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
            isLoading
                ? kCircularLoadingProgress
                : DefaultButton(
                    text: "${AppLocalizations.of(context)!.place_order}",
                    onTap: placeOrder,
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
