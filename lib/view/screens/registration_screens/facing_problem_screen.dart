import 'package:flutter/material.dart';
import 'package:salute/view/screens/registration_screens/wohoo_screen.dart';

import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';

class FacingProblemScreen extends StatelessWidget {
  const FacingProblemScreen({super.key});
  static const String routeName = "FacingProblemScreen";
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
                  Image.asset("assets/images/contact_us.png"),
                  const Spacer(),
                  const UnderPictureBody(
                    body: "You done it Registration compelete",
                    title: "Facing a problem it’s ok we got you back",
                  ),
                  const Spacer(),
                  DefaultButton(
                    text: "Next",
                    onTap: () {
                      Navigator.pushNamed(context, WohooScreen.routeName);
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
