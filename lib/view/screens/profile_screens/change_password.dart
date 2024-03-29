import 'package:flutter/material.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/registration_components/password_field.dart';

import '../../../constants.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});
  static const String routeName = "ChangePasswordScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: kArrowBack(context),
        title: const Text(
          "Change Password",
          style:kAppBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Current Password",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const PasswordFormField(
              textColor: Colors.black,
              focusColor: Colors.black,
              color: Colors.black,
              confirmPassword: false,
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              "New password",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const PasswordFormField(
              textColor: Colors.black,
              focusColor: Colors.black,
              color: Colors.black,
              confirmPassword: false,
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              "Confirm new password",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const PasswordFormField(
              textColor: Colors.black,
              focusColor: Colors.black,
              color: Colors.black,
              confirmPassword: false,
            ),
            const SizedBox(
              height: 32,
            ),
            DefaultButton(
              margin: 64,
              text: "Submit",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
