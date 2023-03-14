import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/data/models/address.dart';
import 'package:salute/data/providers/addresses_provider.dart';
import 'package:salute/view/components/profile_components/address_list_tile.dart';

class AddressesListView extends StatelessWidget {
  const AddressesListView({
    super.key,
    required this.addresses,
  });
  final List<Address> addresses;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemBuilder: (context, index) => Dismissible(
        onDismissed: (direction) async {
          Provider.of<AddressesProvider>(context, listen: false).deleteAddress(
            id: addresses[index].id,
            token: await SharedPreferencesHelper.getSavedUser(),
          );
        },
        background: Container(
          padding: const EdgeInsets.only(right: 30),
          color: Colors.red,
          child: const Align(
              alignment: Alignment.centerRight,
              child: Icon(
                Icons.delete,
                size: 40,
                color: Colors.white,
              )),
        ),
        key: ValueKey(addresses[index]),
        child: AddressListTile(
          address: addresses[index],
        ),
      ),
      itemCount: addresses.length,
      separatorBuilder: (context, index) => Container(
        height: 1,
        color: Colors.grey,
      ),
    );
  }
}
