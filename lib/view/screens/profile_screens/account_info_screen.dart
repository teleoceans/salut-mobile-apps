import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/view/components/default_form_field.dart';
import 'package:salute/view/components/registration_components/date_picker_field.dart';
import 'package:salute/view/components/registration_components/gender_widget.dart';
import 'package:salute/constants.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../data/helpers/shared_preferences.dart';

class AccountInfoScreen extends StatefulWidget {
  const AccountInfoScreen({super.key});
  static const String routeName = 'AccountInfoScreen';

  @override
  State<AccountInfoScreen> createState() => _AccountInfoScreenState();
}

class _AccountInfoScreenState extends State<AccountInfoScreen> {
   TextEditingController birthdayController = TextEditingController();
   TextEditingController nameController = TextEditingController();
   TextEditingController phoneNumberController = TextEditingController();
   TextEditingController emailController = TextEditingController();
   TextEditingController gender = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized();
    nameController.text=SharedPreferencesHelper.data['name'];
    emailController.text=SharedPreferencesHelper.data['email'];
    phoneNumberController.text=SharedPreferencesHelper.data['phone_number'];
    birthdayController.text=SharedPreferencesHelper.data['birthday'];
    gender.text=SharedPreferencesHelper.data['gender'];
    print(SharedPreferencesHelper.data['points']);

    setState(() {

    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: kArrowBack(context),
        title:  Text(
          "${AppLocalizations.of(context)!.account_info}",
          style: kAppBarTitleStyle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:  [
            Text(
              "${AppLocalizations.of(context)!.name}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultFormField(
              enabled: false,
              controller: nameController,
              textColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            const  SizedBox(
              height: 36,
            ),
            Text(
              "${AppLocalizations.of(context)!.email}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultFormField(
              enabled: false,
              controller: emailController,
              textColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              "${AppLocalizations.of(context)!.number}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultFormField(
              enabled: false,
              controller: phoneNumberController,
              textColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            const SizedBox(
              height: 36,
            ),
            // GenderWidget(
            //   textColor: Colors.black,
            // ),
            Text(
             "${AppLocalizations.of(context)!.gender}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultFormField(
              enabled: false,
              controller: gender,
              textColor: Colors.black,
              keyboardType: TextInputType.none,
            ),
            const SizedBox(
              height: 36,
            ),
            Text(
              "${AppLocalizations.of(context)!.dateOfBirth}",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.w500,
                fontSize: 22,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            DefaultFormField(
              enabled: false,
              controller: birthdayController,
              textColor: Colors.black,
              keyboardType: TextInputType.none,
            ),

            // DatePickerField(
            //   enabled: false,
            //   controller: birthdayController,
            //   prefixColor: kPrimaryColor,
            // )
          ],
        ),
      ),
    );
  }
}
