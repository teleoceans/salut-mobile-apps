import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/addresses_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/profile_components/address_container.dart';
import 'package:salute/view/components/shopping_components/delivery_now_container.dart';
import 'package:salute/view/components/shopping_components/door_to_door.dart';
import 'package:salute/view/components/shopping_components/schedule_delivery_container.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/shopping_screens/order_details_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CheckoutScreen extends StatelessWidget {
  const CheckoutScreen({super.key});
  static const String routeName = "CheckoutScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: kArrowBack(context),
        title:   Text(
          "${AppLocalizations.of(context)!.checkout}",
          style: TextStyle(color: Colors.black, fontSize: 24),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 12,
              ),
               AddressContainer(
                margin: 16,
                address: Provider.of<AddressesProvider>(context, listen: false).currentAddress,
                suffixText: "${AppLocalizations.of(context)!.change}",
              ),
              const SizedBox(
                height: 16,
              ),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "${AppLocalizations.of(context)!.add_promo}",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 2,
                      spreadRadius: 3,
                    )
                  ],
                ),
                child: TextFormField(
                  style: const TextStyle(color: Colors.black),
                  decoration:  InputDecoration(
                    hintText: "${AppLocalizations.of(context)!.type_here}",
                    // alignLabelWithHint: true,
                    labelStyle: TextStyle(color: Colors.black),
                    fillColor: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "${AppLocalizations.of(context)!.delivery}",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const DeliveryNowContainer(),
              const SizedBox(
                height: 16,
              ),
              const ScheduleDeliveryContainer(),
              const SizedBox(
                height: 16,
              ),
                Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  "${AppLocalizations.of(context)!.delivery_method}",
                  style: TextStyle(
                    color: Color(0xFF666666),
                    fontWeight: FontWeight.w700,
                    fontSize: 18,
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const DoorToDoor(),
              const SizedBox(
                height: 32,
              ),
              DefaultButton(
                text:  "${AppLocalizations.of(context)!.checkout}",
                onTap: () {
                  Navigator.pushNamed(context, OrderDetailsScreen.routeName);
                },
                margin: 16,
              ),
              const SizedBox(
                height: 12,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
