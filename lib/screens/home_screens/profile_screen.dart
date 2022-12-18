import 'package:flutter/material.dart';
import 'package:salute/components/default_button.dart';
import 'package:salute/components/profile_components/address_container.dart';
import 'package:salute/components/profile_components/profile_container.dart';
import 'package:salute/screens/faq_screen/about_us.dart';
import 'package:salute/screens/profile_screens/settings_screen.dart';

import '../../components/default_form_field.dart';
import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});
  static const String routeName = "ProfileScreen";
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(16),
            child: DefaultFormField(
              borderRadius: 16,
              unFocusColor: Colors.transparent,
              focusColor: Colors.black.withOpacity(0.2),
              textColor: Colors.black,
              keyboardType: TextInputType.text,
              prefixIcon: const Icon(
                Icons.search,
                size: 28,
                color: kPrimaryColor,
              ),
            ),
          ),
        ),
        const SizedBox(height: 32),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              const Expanded(
                child: Text(
                  "Mo Hamed",
                  style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              Material(
                elevation: 2,
                child: DefaultButton(
                  borderColor: kPrimaryColor,
                  backgroundColor: Colors.white,
                  text: "Edit Profile",
                  textSize: 16,
                  textColor: kPrimaryColor,
                  fontWeight: FontWeight.normal,
                  width: 120,
                  onTap: () {
                    Navigator.pushNamed(context, SettingsScreen.routeName);
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        const AddressContainer(
          address: "2464 Royal Ln. Mesa, New Jersey 45463 ",
        ),
        const SizedBox(
          height: 32,
        ),
        Expanded(
          child: ListView(
            children: const [
              SizedBox(
                height: 12,
              ),
              ProfileContainer(
                isShadow: true,
                isIcon: false,
                prefixIcon: "assets/images/tkafol_drawer.png",
                title: "Tkafol",
                fontWeight: FontWeight.bold,
                suffixText: "200.00 pt",
              ),
              SizedBox(
                height: 12,
              ),
              ProfileContainer(
                isIcon: true,
                isShadow: true,
                prefixIcon: "",
                title: "Favorite",
              ),
              SizedBox(
                height: 12,
              ),
              ProfileContainer(
                isIcon: false,
                isShadow: true,
                prefixIcon: "assets/images/contact_us_drawer.png",
                title: "Contact us",
              ),
              SizedBox(
                height: 12,
              ),
              ProfileContainer(
                isIcon: false,
                isShadow: true,
                prefixIcon: "assets/images/about_us_drawer.png",
                title: "About us",
              ),
              SizedBox(
                height: 12,
              ),
              ProfileContainer(
                isIcon: false,
                isShadow: true,
                prefixIcon: "assets/images/terms_of_use.png",
                title: "Terms of use",
              ),
              SizedBox(
                height: 12,
              ),
              ProfileContainer(
                isIcon: false,
                isShadow: true,
                title: "Change language",
                suffixText: "عربي",
                suffixTextColor: kPrimaryColor,
              ),
              SizedBox(
                height: 16,
              ),
              FindUsSocailMedia(),
            ],
          ),
        ),
        const SizedBox(
          height: 30,
        ),
      ],
    );
  }
}
