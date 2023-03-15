import 'package:flutter/material.dart';
import 'package:salute/constants.dart';
import 'package:salute/view/components/registration_components/password_field.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
        title:   Text(
          "${AppLocalizations.of(context)!.change_email}",
          style: kAppBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              Text(
              "${AppLocalizations.of(context)!.new_email}",
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
              Text(
              "${AppLocalizations.of(context)!.confirm_email}",
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
              Text(
              "${AppLocalizations.of(context)!.password}",
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
              text: "${AppLocalizations.of(context)!.submit}",
              onTap: () {},
            ),
          ],
        ),
      ),
    );
  }
}
