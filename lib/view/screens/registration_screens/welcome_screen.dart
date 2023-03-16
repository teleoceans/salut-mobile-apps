import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:salute/constants.dart';
import 'package:salute/data/providers/category_provider.dart';
import 'package:salute/view/components/default_button.dart';
import 'package:salute/main.dart';
import 'package:salute/view/screens/registration_screens/sign_in_screen.dart';
import 'package:salute/view/screens/registration_screens/signup_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});
  static const String routeName = "WelcomeScreen";

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  bool isLoading = false;
  bool isSuccess = true;
  void getData() async {
    setState(() {
      isLoading = true;
    });
    isSuccess = true;
    await Provider.of<CategoryProvider>(context, listen: false)
        .getTakeawayCategoriesFromApi()
        .catchError((_) {
      isSuccess = false;
    }).then((_) {
      if (isSuccess) {
        Navigator.pushReplacementNamed(context, MyHomePage.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
              'assets/images/login_wallpaper.png',
            ),
            fit: BoxFit.cover,
          ),
        ),
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: SafeArea(
          child: Column(
            children: [
              const Spacer(),
              Image.asset("assets/images/salute_logo.png"),
              const SizedBox(
                height: 12,
              ),
              Text(
                "${AppLocalizations.of(context)!.welcome}",
                style: TextStyle(
                  fontSize: 34,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Spacer(),
              DefaultButton(
                text: "${AppLocalizations.of(context)!.login}",
                onTap: () =>
                    Navigator.pushNamed(context, SignInScreen.routeName),
              ),
              const SizedBox(
                height: 18,
              ),
              DefaultButton(

                 text: "${AppLocalizations.of(context)!.register}",
                onTap: () {
                  Navigator.pushReplacementNamed(
                      context, SignUpScreen.routeName);
                },
              ),
              const SizedBox(
                height: 18,
              ),
              isLoading
                  ? kCircularLoadingProgress
                  : DefaultButton(
                      text: "${AppLocalizations.of(context)!.guest}",
                      backgroundColor: Colors.transparent,
                      borderColor: Colors.white,
                      onTap: getData,
                    ),
              const SizedBox(
                height: 50,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
