import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/registration_components/under_picture_body.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/registration_screens/check_email.dart';

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({super.key});
  static const String routeName = "ForgetPasswordScreen";

  @override
  State<ForgetPasswordScreen> createState() => _ForgetPasswordScreenState();
}

class _ForgetPasswordScreenState extends State<ForgetPasswordScreen> {
  bool isLoading = false;
  final TextEditingController emailController = TextEditingController();
  void resetPassword() async {
    setState(() {
      isLoading = true;
    });
    await Provider.of<AuthProvider>(context, listen: false)
        .sendCodeToUserMailForChangePassword(email: emailController.text)
        .then((value) {
      setState(() {
        isLoading = false;
      });
      Navigator.pushNamed(context, CheckYourEmailScreen.routeName);
    }).catchError((error) {
      setState(() {
        isLoading = false;
      });
      log(error);
    });
  }

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
              DefaultFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                focusColor: kPrimaryColor,
                textColor: Colors.black,
              ),
              const Spacer(),
              isLoading
                  ? kCircularLoadingProgress
                  : DefaultButton(
                      text: "Send",
                      onTap: resetPassword,
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Remember password?",
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
