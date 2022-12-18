import 'package:flutter/material.dart';
import 'package:salute/components/profile_components/notifaction_row.dart';
import 'package:salute/constants.dart';
import 'package:salute/screens/profile_screens/account_info_screen.dart';
import 'package:salute/screens/profile_screens/change_email.dart';
import 'package:salute/screens/profile_screens/change_password.dart';

import '../faq_screen/about_us.dart';
import '../faq_screen/app_feedback.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});
  static const String routeName = "SettingsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 30,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Settings",
          style: TextStyle(
            color: Colors.black,
            fontSize: 24,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: const [
            AboutUsListTile(
              title: 'Account Info',
              nextRoute: AccountInfoScreen.routeName,
            ),
            AboutUsListTile(
              title: 'Saved Address',
              nextRoute: AppFeedbackScreen.routeName,
            ),
            AboutUsListTile(
              title: 'Change email',
              nextRoute: ChangeEmailScreen.routeName,
            ),
            AboutUsListTile(
              title: 'Change password',
              nextRoute: ChangePasswordScreen.routeName,
            ),
            NotificationRow(title: "Notifications"),
            ListTile(
              title: Text(
                "Change language",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              trailing: Text(
                "عربي",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
            ),
            ListTile(
              title: Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
