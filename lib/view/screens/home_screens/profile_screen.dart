import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/data/helpers/shared_preferences.dart';
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
      physics: BouncingScrollPhysics(),
      children: [
        const SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Material(
            elevation: 5,
            borderRadius: BorderRadius.circular(16),
            child:  SearchFormField(),
          ),
        ),
        const SizedBox(height: 32),
        Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty?Container():Padding(
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
        Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty?Container():const SizedBox(
          height: 32,
        ),
        Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty?Padding(
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
        Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty?Container():AddressContainer(
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
          suffixText: "${Provider.of<AuthProvider>(context, listen: false).authToken.isEmpty?0:SharedPreferencesHelper.data['points']==null?0:SharedPreferencesHelper.data['points']} pt",
        ),
        const SizedBox(
          height: 12,
        ),
        ProfileContainer(
          onTap: () {
            LaunchUrl("https://m.me/100089473891428");
          },
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
              }
              else{
                MyApp.setLocale(context, Locale("en",""));
              }
            });
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
        const SizedBox(
          height: 80,
        ),
      ],
    );
  }
}
