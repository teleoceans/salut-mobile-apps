import 'package:flutter/material.dart';
import 'package:salute/components/default_button.dart';
import 'package:salute/screens/registration_screens/enter_code_screen.dart';

import '../../components/registration_components/under_picture_body.dart';

class CheckYourEmailScreen extends StatelessWidget {
  const CheckYourEmailScreen({super.key});
  static const String routeName = "CheckYourEmailScreen";
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset("assets/images/check_mail.png"),
              const Spacer(),
              const UnderPictureBody(
                body:
                    "Password has been sent to you email. please check your email and follow instructions",
                title: "Check you email!",
              ),
              const Spacer(),
              DefaultButton(
                text: "Next",
                onTap: () {
                  Navigator.pushNamed(context, EnterCodeScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
