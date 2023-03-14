import 'package:flutter/material.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/profile_components/notifaction_row.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/screens/profile_screens/account_info_screen.dart';
import 'package:salute/view/screens/profile_screens/change_email.dart';
import 'package:salute/view/screens/profile_screens/change_password.dart';
import 'package:salute/view/screens/registration_screens/welcome_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../faq_screen/about_us.dart';
import '../faq_screen/app_feedback.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});
  static const String routeName = "SettingsScreen";

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: kArrowBack(context),
        title:   Text(
          "${AppLocalizations.of(context)!.settings}",
          style: kAppBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
              AboutUsListTile(
              title: "${AppLocalizations.of(context)!.account_info}",
              nextRoute: AccountInfoScreen.routeName,
            ),
              AboutUsListTile(
              title:  "${AppLocalizations.of(context)!.saved_addresses}",
              nextRoute: AppFeedbackScreen.routeName,
            ),
            // const AboutUsListTile(
            //   title: 'Change email',
            //   nextRoute: ChangeEmailScreen.routeName,
            // ),
            // const AboutUsListTile(
            //   title: 'Change password',
            //   nextRoute: ChangePasswordScreen.routeName,
            // ),
             NotificationRow(title: "${AppLocalizations.of(context)!.notifications}",
              ),
            ListTile(
              title: Text(
                "${AppLocalizations.of(context)!.changeLanguage}",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
              trailing: Text(
                "${AppLocalizations.of(context)!.language}",
                style: TextStyle(
                  color: kPrimaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 22,
                ),
              ),
              onTap: (){
                setState(() {
                  String s=AppLocalizations.of(context)!.settings;
                  if(s.toString().toLowerCase()=="Settings".toString().toLowerCase()){
                    MyApp.setLocale(context, Locale("ar",""));
                    print("object1");
                  }
                  else{
                    MyApp.setLocale(context, Locale("en",""));
                    print("object");
                  }
                });
              },
            ),
            ListTile(
              title:   Text(
                "${AppLocalizations.of(context)!.logout}",
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
            ListTile(
              title:   Text(
                "${AppLocalizations.of(context)!.account_delete}",
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
