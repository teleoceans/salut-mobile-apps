import 'package:flutter/material.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/profile_screens/add_address_screen.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';

class NoAddressScreen extends StatelessWidget {
  const NoAddressScreen({super.key});
  static const String routeName = "NoAddressScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
            color: kPrimaryColor,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Addresses",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 24,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: Column(
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
                  Navigator.pushNamed(context, AddAddressScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
