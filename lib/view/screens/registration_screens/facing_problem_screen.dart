import 'package:flutter/material.dart';
import 'package:salute/view/screens/registration_screens/wohoo_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../constants.dart';
import '../../components/default_button.dart';
import '../../components/registration_components/under_picture_body.dart';
import 'dart:io' show Platform;

class FacingProblemScreen extends StatelessWidget {
  const FacingProblemScreen({super.key});
  static const String routeName = "FacingProblemScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: kSkipApp(context),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(
            top: 32,
            left: 16,
            right: 16,
            bottom: Platform.isAndroid ? 16 : 0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height / 2.3,
                child: Image.asset("assets/images/contact_us.png"),
              ),
              const Spacer(),
                UnderPictureBody(
                body: "${AppLocalizations.of(context)!.reg_mass1}",
                title: "${AppLocalizations.of(context)!.reg_mass2}",
              ),
              const Spacer(),
              DefaultButton(
                text: "${AppLocalizations.of(context)!.next}",
                onTap: () {
                  Navigator.pushNamed(context, WohooScreen.routeName);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
