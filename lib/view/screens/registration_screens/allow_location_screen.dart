import 'package:flutter/material.dart';
import 'package:salute/view/screens/registration_screens/order_anywhere_screen.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';
import '../../../constants.dart';

class AllowLocationScreen extends StatelessWidget {
  const AllowLocationScreen({super.key});
  static const String routeName = "AllowLocationScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: 16,
          ),
          child: SingleChildScrollView(
            child: SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/share_location.png"),
                  const Spacer(),
                  const UnderPictureBody(
                    body:
                        "Please enable location access so we could provide you with accurate results",
                    title: "Share Location",
                  ),
                  const Spacer(),
                  DefaultButton(
                    margin: 60,
                    text: "Allow",
                    onTap: () {
                      Navigator.pushNamed(
                          context, OrderAnywhereScreen.routeName);
                    },
                  ),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Skip",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
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
