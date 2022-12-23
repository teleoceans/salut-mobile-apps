import 'package:flutter/material.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/registration_components/custom_check_box.dart';
import 'package:salute/view/components/registration_components/date_picker_field.dart';
import 'package:salute/view/components/registration_components/gender_widget.dart';
import 'package:salute/view/components/registration_components/sign_with_social_media.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/registration_screens/allow_location_screen.dart';

import '../../components/default_form_field.dart';
import '../../components/registration_components/password_field.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({super.key});
  static const String routeName = "SignupScreen";
  final TextEditingController _dateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/login_wallpaper.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: ListView(
            children: [
              Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/salute_logo.png")),
              const SizedBox(
                height: 12,
              ),
              const SignWithSocialMedia(
                title: "Sign up with",
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Name",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const DefaultFormField(
                keyboardType: TextInputType.name,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Email",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const DefaultFormField(
                keyboardType: TextInputType.emailAddress,
              ),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Password",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const PasswordFormField(confirmPassword: false),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Phone Number",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              const DefaultFormField(
                keyboardType: TextInputType.phone,
              ),
              const GenderWidget(),
              const SizedBox(
                height: 12,
              ),
              const Text(
                "Birthday",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              DatePickerField(
                controller: _dateController,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  const CustomCheckBox(title: "I agree to "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Terms",
                      style: TextStyle(
                        color: kTermsAndConditionsColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const Text(" and "),
                  GestureDetector(
                    onTap: () {},
                    child: const Text(
                      "Conditions",
                      style: TextStyle(
                        color: kTermsAndConditionsColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 12,
              ),
              DefaultButton(
                  text: "Continue",
                  onTap: () {
                    Navigator.pushReplacementNamed(
                        context, AllowLocationScreen.routeName);
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
