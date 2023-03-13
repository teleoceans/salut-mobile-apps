import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/providers/addresses_provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/view/components/profile_components/addresses_list_view.dart';
import 'package:salute/view/screens/profile_screens/add_address_screen.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';

class AddressesScreen extends StatefulWidget {
  const AddressesScreen({super.key});
  static const String routeName = "NoAddressScreen";

  @override
  State<AddressesScreen> createState() => _AddressesScreenState();
}

class _AddressesScreenState extends State<AddressesScreen> {
  Future<void> getAddresses() async {
  
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: Provider.of<AddressesProvider>(context).addresses.isNotEmpty
            ? [
                TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, AddAddressScreen.routeName);
                    },
                    child: const Text(
                      "Add",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 21,
                        color: kPrimaryColor,
                      ),
                    ))
              ]
            : null,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: kArrowBack(context),
        title: const Text(
          "Addresses",
          style: kAppBarTitleStyle,
        ),
      ),
      body: SafeArea(
        child: Padding(
            padding: const EdgeInsets.only(
              top: 16,
              left: 16,
              right: 16,
              bottom: 16,
            ),
            child: FutureBuilder(
              future: getAddresses(),
              builder: (context, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                    ? kCircularLoadingProgress
                    : Provider.of<AddressesProvider>(context)
                            .addresses
                            .isNotEmpty
                        ? AddressesListView(
                            addresses: Provider.of<AddressesProvider>(context)
                                .addresses,
                          )
                        : Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/images/no_address.png"),
                              const Spacer(),
                              const UnderPictureBody(
                                body: "Add one now to use for future orders",
                                title: "Looks like you didn’t save an address",
                              ),
                              const Spacer(),
                              DefaultButton(
                                text: "Add Address",
                                onTap: () {
                                  Navigator.pushNamed(
                                      context, AddAddressScreen.routeName);
                                },
                              ),
                            ],
                          );
              },
            )),
      ),
    );
  }
}
