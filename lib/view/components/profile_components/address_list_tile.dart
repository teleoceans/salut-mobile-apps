import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/models/address.dart';
import 'package:salute/data/providers/addresses_provider.dart';
import 'package:salute/view/screens/profile_screens/add_address_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddressListTile extends StatelessWidget {
  const AddressListTile({
    super.key,
    required this.address,
  });
  final Address address;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(
          context,
          AddAddressScreen.routeName,
          arguments: address.id,
        );
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "${address.addressName} (${address.area.areaName})",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${AppLocalizations.of(context)!.apartment}: ${address.apartmentNumber}, ${AppLocalizations.of(context)!.floor}: ${address.floorNumber}, ${address.buildNumber} ${address.streetName} st.",
                        style: const TextStyle(
                          color: Colors.grey,
                        ),
                      ),
                      
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Provider.of<AddressesProvider>(context, listen: false)
                        .changeCurrent = address.id;
                  },
                  child: CircleAvatar(
                    radius: 13,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 12,
                      backgroundColor: Colors.white,
                      child: CircleAvatar(
                        backgroundColor: Provider.of<AddressesProvider>(context)
                                    .currentAddress!
                                    .id ==
                                address.id
                            ? Colors.green
                            : Colors.white,
                        radius: 10,
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
