import 'package:flutter/material.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/components/registration_components/password_field.dart';

import '../../components/default_button.dart';
import '../../components/default_form_field.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});
  static const String routeName = "ChangeEmailScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: kArrowBack(context),
        title: const Text(
          "Change email",
          style: kAppBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "New email",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const DefaultFormField(
              textColor: Colors.black,
              focusColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              "Confirm new email",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const DefaultFormField(
              textColor: Colors.black,
              focusColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            const SizedBox(
              height: 36,
            ),
            const Text(
              "Password",
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
              confirmPassword: true,
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
