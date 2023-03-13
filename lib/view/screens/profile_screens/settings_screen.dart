import 'package:flutter/material.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/view/components/profile_components/notifaction_row.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/profile_screens/account_info_screen.dart';
import 'package:salute/view/screens/profile_screens/change_email.dart';
import 'package:salute/view/screens/profile_screens/change_password.dart';
import 'package:salute/view/screens/registration_screens/welcome_screen.dart';

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
        leading: kArrowBack(context),
        title: const Text(
          "Settings",
          style: kAppBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const AboutUsListTile(
              title: 'Account Info',
              nextRoute: AccountInfoScreen.routeName,
            ),
            const AboutUsListTile(
              title: 'Saved Address',
              nextRoute: AppFeedbackScreen.routeName,
            ),
            const AboutUsListTile(
              title: 'Change email',
              nextRoute: ChangeEmailScreen.routeName,
            ),
            const AboutUsListTile(
              title: 'Change password',
              nextRoute: ChangePasswordScreen.routeName,
            ),
            const NotificationRow(title: "Notifications"),
            const ListTile(
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
              title: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              onTap: () async {
                await SharedPreferencesHelper.removeUser().then((_) {
                  Navigator.pop(context);
                  Navigator.pushReplacementNamed(
                      context, WelcomeScreen.routeName);
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}
