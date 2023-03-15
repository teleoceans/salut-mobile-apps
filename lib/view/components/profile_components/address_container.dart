import 'package:flutter/material.dart';
import 'package:salute/data/models/address.dart';
import 'package:salute/view/screens/profile_screens/addresses_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
class AddressContainer extends StatelessWidget {
  const AddressContainer({
    super.key,
    this.address,
    this.onPressed,
    this.suffixText,
    this.margin,
  });
  final Address? address;
  final String? suffixText;
  final VoidCallback? onPressed;
  final double? margin;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: margin ?? 16),
      padding: const EdgeInsets.all(12),
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
      child: Row(
        children: [
          if (address == null)
              Expanded(
              child: Center(
                child: Text(
                  "${AppLocalizations.of(context)!.no_addresses}",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            )
          else
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${address!.addressName} (${address!.area.areaName})",
                    style: const TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    "${AppLocalizations.of(context)!.apartment}: ${address!.apartmentNumber}, ${AppLocalizations.of(context)!.floor}: ${address!.floorNumber}, ${address!.buildNumber} ${address!.streetName} st.",
                    style: const TextStyle(
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
          TextButton(
            onPressed: () {
              Navigator.pushNamed(context, AddressesScreen.routeName);
            },
            child: Text(
              suffixText ??  "${AppLocalizations.of(context)!.add}",
              style: const TextStyle(
                fontSize: 18,
                color: Colors.green,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
