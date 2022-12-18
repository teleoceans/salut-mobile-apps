import 'package:flutter/material.dart';
import 'package:salute/screens/registration_screens/help_tkafol_screen.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';

class OrderAnywhereScreen extends StatelessWidget {
  const OrderAnywhereScreen({super.key});
  static const String routeName = "OrderAnywhereScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height,
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
                  Image.asset("assets/images/order_anywhere.png"),
                  const Spacer(),
                  const UnderPictureBody(
                    body: "You done it Registration compelete",
                    title: "Order anywhere",
                  ),
                  const Spacer(),
                  DefaultButton(
                    text: "Next",
                    onTap: () {
                      Navigator.pushNamed(
                          context, HelpWithTkafolScreen.routeName);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
