import 'package:flutter/material.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/screens/registration_screens/enter_code_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
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
              UnderPictureBody(
                body:"${AppLocalizations.of(context)!.check_email_mass}",
                  title:"${AppLocalizations.of(context)!.check_email}"

              ),
              const Spacer(),
              DefaultButton(
                text: "${AppLocalizations.of(context)!.next}",
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
