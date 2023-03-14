import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/providers/addresses_provider.dart';
import 'package:salute/data/providers/auth_provider.dart';
import 'package:salute/main.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/view/components/profile_components/address_container.dart';
import 'package:salute/view/components/profile_components/profile_container.dart';
import 'package:salute/view/components/shopping_components/tkafol_container.dart';
import 'package:salute/view/screens/faq_screen/about_us.dart';
import 'package:salute/view/screens/faq_screen/terms_of_use_screen.dart';
import 'package:salute/view/screens/profile_screens/settings_screen.dart';
import 'package:salute/view/screens/registration_screens/sign_in_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../components/default_form_field.dart';
import '../../../constants.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});
  static const String routeName = "ProfileScreen";

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(16),
            child: DefaultFormField(
              borderRadius: 16,
              hintText: "${AppLocalizations.of(context)!.search}",
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
        Token.isEmpty?Container():Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  Provider.of<AuthProvider>(context, listen: false).userName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              DefaultButton(
                borderColor: kPrimaryColor,
                backgroundColor: Colors.white,
                text: "${AppLocalizations.of(context)!.edit}",
                textSize: 16,
                textColor: kPrimaryColor,
                fontWeight: FontWeight.normal,
                width: 120,
                onTap: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
              ),
            ],
          ),
        ),
        Token.isEmpty?Container():const SizedBox(
          height: 32,
        ),
        Token.isEmpty?Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  Provider.of<AuthProvider>(context, listen: false).userName,
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
              ),
              DefaultButton(
                borderColor: kPrimaryColor,
                backgroundColor: Colors.white,
                text: "${AppLocalizations.of(context)!.login}",
                textSize: 16,
                textColor: kPrimaryColor,
                fontWeight: FontWeight.normal,
                width: 120,
                onTap: () {
                  Navigator.pushNamed(context, SignInScreen.routeName);
                },
              ),
            ],
          ),
        ):Container(),
        Token.isEmpty?Container():AddressContainer(
          address: Provider.of<AddressesProvider>(context).currentAddress,
        ),
        const SizedBox(
          height: 32,
        ),
        // const SizedBox(
        //   height: 12,
        // ),
        ProfileContainer(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => const TkafolComponent(),
            );
          },
          isShadow: true,
          isIcon: false,
          prefixIcon: "assets/images/tkafol_drawer.png",
          title: "${AppLocalizations.of(context)!.tkafol}",
          fontWeight: FontWeight.bold,
          suffixText: "200.00 pt",
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileContainer(
          onTap: () {},
          isIcon: false,
          isShadow: true,
          prefixIcon: "assets/images/contact_us_drawer.png",
          title: "${AppLocalizations.of(context)!.contact}",
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileContainer(
          isIcon: false,
          isShadow: true,
          prefixIcon: "assets/images/about_us_drawer.png",
          title: "${AppLocalizations.of(context)!.aboutUs}",
          onTap: () => Navigator.pushNamed(context, AboutUsScreen.routeName),
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileContainer(
          onTap: () {
            Navigator.pushNamed(context, TermsOfUseScreen.routeName);
          },
          isIcon: false,
          isShadow: true,
          prefixIcon: "assets/images/terms_of_use.png",
          title: "${AppLocalizations.of(context)!.terms}",
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileContainer(
          onTap: () async{

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

            // if (language != null) {
            //   Locale _locale = await setLocale(language.languageCode);
            //   MyApp.setLocale(context, _locale);
            // }
          },
          isIcon: false,
          isShadow: true,
          title: "${AppLocalizations.of(context)!.changeLanguage}",
          suffixText: "${AppLocalizations.of(context)!.language}",
          suffixTextColor: kPrimaryColor,
        ),
        const SizedBox(
          height: 16,
        ),
        const FindUsSocailMedia(),
      ],
    );
  }
}
