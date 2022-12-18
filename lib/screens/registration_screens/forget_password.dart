import 'package:flutter/material.dart';
import 'package:salute/components/default_button.dart';
import 'package:salute/components/default_form_field.dart';
import 'package:salute/components/registration_components/under_picture_body.dart';
import 'package:salute/constants.dart';
import 'package:salute/screens/registration_screens/check_email.dart';

class ForgetPasswordScreen extends StatelessWidget {
  const ForgetPasswordScreen({super.key});
  static const String routeName = "ForgetPasswordScreen";
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
              Image.asset("assets/images/forget_password.png"),
              const UnderPictureBody(
                body:
                    "Enter your registered email below to receive password reset and instruction",
                title: "Forget Password?",
              ),
              const Spacer(),
              const Text(
                "Enter your email",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              const DefaultFormField(
                keyboardType: TextInputType.emailAddress,
                focusColor: kPrimaryColor,
                textColor: Colors.black,
              ),
              const Spacer(),
              DefaultButton(
                text: "Send",
                onTap: () {
                  Navigator.pushNamed(context, CheckYourEmailScreen.routeName);
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Remember password",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Sign in",
                      style: TextStyle(
                        color: kPrimaryColor,
                        fontSize: 16,
                      ),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
